# botpress-heroku
This project is intended to deploy Botpress chatbot on Heroku cloud using docker image.

### Prerequisites
1. Install heroku CLI by referring to https://devcenter.heroku.com/articles/heroku-cli
2. Verify your heroku CLI installation using the command `heroku --version`
3. Install Docker for your OS by referring to https://docs.docker.com/engine/install/
Please note that Docker should be up and running while performing the installation/deployment

### Deployment on Heroku
Follow the below steps to deploy Botpress on a new Heroku environment/app.
1. Open your preferred CLI and navigate to the root directory of this project
2. Your Docker file will be located in this directory
3. You should also paste your `/data` folder here if willing to import existing data and code changes
4. Login to your heroku account using CLI via command `heroku login`
5. You have to press any key when asked and it will open a browser window for login
6. Create a heroku app using the command `heroku create`
7. The created app name will be shown after successful execution, please note down this app name
8. Login to heroku container registrey using the command `heroku container:login`
9. Build a custom docker image using the Docker file via command `heroku container:push web --app $APP_NAME`
10. Please note that `$APP_NAME` refers to the same app name which was created above
11. Release this image to heroku app using the command `heroku container:release web --app $APP_NAME`

### Configuration to use PostgreSql database
This is a cruicial step to consider else any data created in Botpress will be gone because the Heroku storage is shared with other pods and will get cleared periodically.
Follow the below steps to create and setup PostgreSql database for your Botpress application.
1. Create an add-on for your heroku app by using the command `heroku addons:create heroku-postgresql --app $APP_NAME`
2. Set the configuration to use this database in place of inbuilt SQLite database using the command `heroku config:set DATABASE=postgres --app $APP_NAME`
3. It is suggested to not open the app and create admin credentials right now

### Configuration of required Environment variables
It is important to configure two values to ensure proper access and functioning of your Botpress application on Heroku cloud.
1. Navigate to your Heroku dashboard which can be found here https://dashboard.heroku.com/apps
2. Click on the name of your app
3. Go to `Settings` tab and click on the button `Reveal Config Vars`
4. Add a new entry with Key as `PGSSLMODE` and Value as `require`
5. Add another entry with Key as `BPFS_STORAGE` and Value as `database`

Now you can access the app and setup admin credential for your Botpress admin dashboard.

### Recurring deployments
After making any code changes that you want to deploy on your existing heroku app, it is only required to create and release the docker image using two commands as listed below.
1. `heroku container:push web --app $APP_NAME`
2. `heroku container:release web --app $APP_NAME`

Please note that some changes such as custom CSS files can only be deployed via this method on Heroku.
