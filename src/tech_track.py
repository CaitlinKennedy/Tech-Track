from flask import Flask
from flask import session, redirect, url_for, escape, request
from flask import request
from flaskext.mysql import MySQL
from flask import render_template
from flask import Flask,jsonify,json


app = Flask(__name__)

#Required code to connect to mySQL database.
mysql = MySQL()
app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'lol'

app.config['MYSQL_DATABASE_DB'] = 'TechTrack'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

#Homepage
#TODO: Replace wtih HTML template when created. 
@app.route('/')
def index():
	if 'username' in session:
		return redirect(url_for('instructions'))
	return redirect(url_for('login'))
	

@app.route('/instructions')
def instructions():
	if 'username' in session:
		return render_template('instructions.html')
	return redirect(url_for('login'))

#Login Page
#Default route only answers to GET requests.
#Can change this by providing methods argument to the route() decorator.
@app.route('/login', methods=['GET', 'POST'])
def login():

	error=None

	#The request was a POST request, i.e. user is submitting form data.
	if request.method == 'POST':

		#Get information from form.
		username = request.form['username']
		password = request.form['password']

		#Check database.
		cursor = mysql.connect().cursor()
		cursor.execute("SELECT * from Users where emailAccount='" + username + "' and password='" + password + "'")
		data = cursor.fetchone()

		if data is None:
			error="Username or password is incorrect."
		else:
			#Session.
			session['username'] = request.form['username']
			return redirect(url_for('instructions'))

	return render_template('login.html', error=error)


#Register. 
@app.route('/register', methods=['GET', 'POST'])
def register():
    error = None
    if request.method == 'POST':
        emailAccount = request.form['username']
        password = request.form['password']

        splitDomainName = emailAccount.split('@')[1]
        if (splitDomainName != 'purdue.edu'):
        	error = "You should use a Purdue email."
    		return render_template('createAccount.html', error=error) 
        

        conn = mysql.connect()
        cursor = conn.cursor()
    
        cursor.execute("SELECT * from Users where emailAccount='" + emailAccount + "'")
        data = cursor.fetchone()
        if data is None:
            #this password is unique so add it to the database
            cursor.execute('''INSERT INTO Users (emailAccount, password, isNewUser, cs180Completed, cs240Completed, cs250Completed, cs251Completed, cs314Completed, cs334Completed, cs381Completed, cs307Completed, cs448Completed, cs456Completed, cs442Completed, cs426Completed) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)''',(emailAccount, password, True, False, False, False, False, False, False, False, False, False, False, False, False))
            conn.commit()

            session['username'] = request.form['username']

            return redirect(url_for('instructions'))
        else: 
            error = "Username is already in use."

    #return "You are already registered" #render html for register page and send error message
    return render_template('createAccount.html', error=error) 

#levelPage1
@app.route('/levelPage1')
def levelPage1():
	if 'username' in session:

		conn = mysql.connect()
		cursor = conn.cursor()

		cursor.execute("SELECT * from Users where emailAccount='" + session['username'] + "'")
		data = cursor.fetchone()
		print(data[1]);

		status180 = data[3]
		status240 = data[4]
		status250=data[5]
		status251=data[6]

		if status180 == True:
			status180 = 0;
		else:
			status180 = 1;

		if status240 == True:
			status240 = 0;
		else:
			status240 = 1;

		if status250 == True:
			status250 = 0;
		else:
			status250 = 1;
		
		if status251 == True:
			status251 = 0;
		else:
			status251 = 1;

		try:
			#initalize a levelData list
			levelData = []
			#create a instance for filling up levelData
			levelDict = {
			'level' : 1,
			'classes': [
					{
						'name': 'CS 180', 
						'status': status180
					}, 
					{
						'name':'CS 240', 
						'status':status240
					}, 
					{
						'name':'CS 250',
						'status':status250
					}, 
					{
						'name':'CS 251', 
						'status':status251
					} 
				]
			}
			levelData.append(levelDict)
			#convert to json data
			jsonStr = json.dumps(levelData)
		except Exception ,e:
			print str(e)
		return jsonify(LevelObj=jsonStr)


		#return render_template('levelPage1.html')
	return redirect(url_for('login'))

@app.route('/levelPage2')
def levelPage2():
	if 'username' in session:
		return render_template('levelPage2.html')
	return redirect(url_for('login'))

@app.route('/levelPage3')
def levelPage3():
	if 'username' in session:
		return render_template('levelPage3.html')
	return redirect(url_for('login'))

@app.route('/courseOverview')
def courseOverview():
	if 'username' in session:
		return render_template('courseOverview.html')
	return redirect(url_for('login'))

#Logout
@app.route('/logout')
def logout(): 
	session.pop('username', None)
	return redirect(url_for('index'))

#Secret Key
app.secret_key = 'A0Zr98j/3yX R~'
