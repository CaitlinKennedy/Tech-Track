from flask import Flask
from flask import session, redirect, url_for, escape, request
from flask import request
from flaskext.mysql import MySQL
from flask import render_template
from flask import Flask,jsonify,json
from string import Template

app = Flask(__name__)

#Required code to connect to mySQL database.
mysql = MySQL()
app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '27'

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

		status180 = data[3]
		status240 = data[4]
		status250=data[5]
		status251=data[6]

		if status180 is 1:
			status180 = 0;
		else:
			status180 = 1;

		if status240 is 1:
			status240 = 0;
		else:
			status240 = 1;

		if status250 is 1:
			status250 = 0;
		else:
			status250 = 1;
		
		if status251 is 1:
			status251 = 0;
		else:
			status251 = 1;

		try:
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
		except Exception ,e:
			print str(e)
		return jsonify(levelDict) 


		#return render_template('levelPage1.html')
	return redirect(url_for('login'))

@app.route('/levelPage2')
def levelPage2():
	if 'username' in session:
		
		conn = mysql.connect()
		cursor = conn.cursor()

		cursor.execute("SELECT * from Users where emailAccount='" + session['username'] + "'")
		data = cursor.fetchone()
		print(data);

		status180 = data[3]
		status240 = data[4]
		status250=data[5]
		status251=data[6]
		status314 = data[7]
		status334 = data[8]
		status381=data[9]
		status307=data[10]


		#From database: 0 is not completed, 1 is completed
		#For the JSON: 0 is completed, 1 is not completed and in current level, 2 is prerequisites arent met
		#If any of level 1's courses are not completed, then user should not be able to do any of level 2 courses
		if ((status180 is 0) or (status240 is 0) or (status250 is 0) or (status251 is 0)):
			status314 = 2;
			status334 = 2;
			status381 = 2;
			status307 = 2;
		else: 
			if status314 is 1:
				status314 = 0;
			else:
				status314 = 1;

			if status334 is 1:
				status334 = 0;
			else:
				status334 = 1;

			if status381 is 1:
				status381 = 0;
			else:
				status381 = 1;
			
			if status307 is 1:
				status307 = 0;
			else:
				status307 = 1;


		try:
			#create a instance for filling up levelData
			levelDict = {
			'level' : 2,
			'classes': [
					{
						'name': 'CS 314', 
						'status': status314
					}, 
					{
						'name':'CS 334', 
						'status':status334
					}, 
					{
						'name':'CS 381',
						'status':status381
					}, 
					{
						'name':'CS 307', 
						'status':status307
					} 
				]
			}
		except Exception ,e:
			print str(e)
		return jsonify(levelDict)

		#return render_template('levelPage2.html')
	return redirect(url_for('login'))

@app.route('/levelPage3')
def levelPage3():
	if 'username' in session:
		
		conn = mysql.connect()
		cursor = conn.cursor()

		cursor.execute("SELECT * from Users where emailAccount='" + session['username'] + "'")
		data = cursor.fetchone()

		status180 = data[3]
		status240 = data[4]
		status250=data[5]
		status251=data[6]
		status314 = data[7]
		status334 = data[8]
		status381=data[9]
		status307=data[10]
		status448 = data[11]
		status456 = data[12]
		status426 = data[13]
		status422 = data[14]

		if (status180 is 0) or (status240 is 0) or (status250 is 0) or (status251 is 0) or (status314 is 0) or (status334 is 0) or (status381 is 0) or (status307 is 0):
			status448 = 2
			status456 = 2
			status426 = 2
			status422 = 2
		else: 		
			if status448 is 1:
				status448 = 0
			else:
				status448 = 1

			if status456 is 1:
				status456 = 0
			else:
				status456 = 1

			if status426 is 1:
				status426 = 0
			else:
				status426 = 1

			if status422 is 1:
				status422 = 0
			else:
				status422 = 1

		try:
			# Create an instance for filling up classData
			levelDict = {
			'level': 3,
			'classes': [
				{
					'name': "CS 448", 
					'status':status448
				}, 
				{
					'name':"CS 456", 
					'status':status456
				}, 
				{
					'name':"CS 426",
					'status':status426
				}, 
				{
					'name':"CS 422", 
					'status':status422
				}
			]}
			
		except Exception ,e:
			print str(e)

		return jsonify(levelDict)

	return redirect(url_for('login'))


@app.route('/overview/<classNum>')
def overview(classNum):
	if 'username' in session:
		classNoSpace = classNum.split(' ')[0]+classNum.split(' ')[1]
		
		conn = mysql.connect()
		cursor = conn.cursor()

		cursor.execute("SELECT courseOverview from courses where courseAbbreviation='" + classNoSpace + "'")
		data = cursor.fetchone()

		return render_template('overview.html', className = classNum, anotherClass = data)
	return redirect(url_for('index'))


#Logout
@app.route('/logout')
def logout(): 
	session.pop('username', None)
	return redirect(url_for('index'))


@app.route('/levels')
def levels(): 
	if 'username' in session:
		return render_template('hallway.html')
	return redirect(url_for('login'))

#Secret Key
app.secret_key = 'A0Zr98j/3yX R~'
