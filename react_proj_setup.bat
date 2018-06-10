@echo off
rem -------- this script done by Stanislav Savolainen ---------------------------
rem  ------- build react.js "hello world" - applicaion on windows-platform ------ 
rem  ------- script require NodeJs to be installed (using npm ) ----------------- 
rem -----------------------------------------------------------------------------
echo "remove project files if exsist"
del package.json
del webpack.config.js
rem https://stackoverflow.com/questions/7331056/how-to-delete-a-folder-with-all-contents-using-a-bat-file-in-windows
@RD /S /Q "src"
@RD /S /Q "node_modules"
del .babelrc
timeout 5
rem -----------------------------------------------------------------------------
echo "Create package.json"
echo {  >> package.json
echo   "name": "client",  >> package.json
echo  "version": "1.0.0",  >> package.json
echo   "description": "",  >> package.json
echo   "main": "index.js",  >> package.json
echo  "scripts": {  >> package.json
echo     "test": "echo \"Error: no test specified\" && exit 1",  >> package.json
echo	  "dev": "webpack -d --watch", >> package.json
echo      "build": "webpack -p" >> package.json
echo   },  >> package.json 
echo   "author": "",  >> package.json
echo   "license": "ISC",  >> package.json
echo   "dependencies": {  >> package.json
echo     "babel-core": "6.26.0",  >> package.json
echo     "babel-loader": "7.1.2",  >> package.json
echo     "babel-preset-es2015": "6.24.1",  >> package.json
echo     "babel-preset-react": "6.24.1",  >> package.json
echo     "react": "16.0.0",  >> package.json
echo     "react-dom": "16.0.0",  >> package.json
echo     "webpack": "3.6.0"  >> package.json
echo   },  >> package.json
echo   "devDependencies": {  >> package.json
echo     "babel-plugin-transform-class-properties": "6.24.1",  >> package.json
echo     "babel-plugin-transform-object-rest-spread": "6.26.0"  >> package.json
echo   }  >> package.json
echo }  >> package.json
rem -----------------------------------------------------------------------------
echo var webpack = require('webpack'); >> webpack.config.js
echo var path = require('path'); >> webpack.config.js
echo.   >> webpack.config.js
echo var BUILD_DIR = path.resolve(__dirname, 'src/client/public');   >> webpack.config.js
echo var APP_DIR = path.resolve(__dirname, 'src/client/app');   >> webpack.config.js
echo.  >> webpack.config.js
echo var config = {   >> webpack.config.js
echo entry: APP_DIR + '/index.jsx',   >> webpack.config.js
echo  output: {    >> webpack.config.js
echo  path: BUILD_DIR,          >> webpack.config.js
echo filename: 'bundle.js'           >> webpack.config.js
echo },           >> webpack.config.js
echo.            >> webpack.config.js
echo  module : {           >> webpack.config.js
echo   loaders : [          >> webpack.config.js
echo    {        >> webpack.config.js
echo      test : /\.jsx?/,        >> webpack.config.js
echo      include : APP_DIR,            >> webpack.config.js
echo      loader : 'babel-loader'           >> webpack.config.js
echo     }           >> webpack.config.js
echo    ]           >> webpack.config.js
echo   }          >> webpack.config.js
echo. >> webpack.config.js
echo  };          >> webpack.config.js
echo.  >> webpack.config.js
echo   module.exports = config; >> webpack.config.js
rem -----------------------------------------------------------------------------
echo "create folder src/client/app"
mkdir src
cd src
mkdir client
cd client
mkdir app
cd app
rem -----------------------------------------------------------------------------
echo "create index.jsx file to src/client/app"
echo // Your first reactJS program, modify this code and recompile it >> index.jsx
echo //use : ^"npm run-script build^" cmd command  >> index.jsx
echo // to update budle.js file then just refresh your browser web-page >> index.jsx
echo import React from 'react'; >> index.jsx
echo import {render} from 'react-dom';  >> index.jsx
echo.          >> index.jsx
echo class App extends React.Component {  >> index.jsx
echo  	render () {  >> index.jsx
echo  		return ^<p^> Hello React!^</p^>;  >> index.jsx
echo  	}        >> index.jsx
echo  }        >> index.jsx
echo  render(^<App/^>, document.getElementById('app'));  >> index.jsx
echo console.log('Hello World!'); >> index.jsx
rem -----------------------------------------------------------------------------
cd ..
echo "create index.html to folder src/client"
rem https://stackoverflow.com/questions/19642622/how-do-i-echo-ascii-art-that-contains-special-characters-in-a-batch-file
rem http://www.robvanderwoude.com/escapechars.php
echo ^<html^>      >> index.html
echo  ^<head^>     >> index.html
echo    ^<meta charset="utf-8"^>     >> index.html
echo   ^<title^>React.js using NPM, Babel6 and Webpack^</title^>     >> index.html
echo  ^</head^>      >> index.html
echo  ^<body^>      >> index.html
echo  	^<div id="app" /^>      >> index.html
echo  	^<script src="public/bundle.js" type="text/javascript"^>^</script^>  >> index.html
echo  ^</body^>   >> index.html
echo  ^</html^> >> index.html
rem -----------------------------------------------------------------------------
cd..
cd..
echo "create .babelrc file "
echo {  >> .babelrc
echo  "presets" : ["es2015", "react"]  >> .babelrc
echo }  >> .babelrc
rem -----------------------------------------------------------------------------
echo "execute nmp install command, installing node_modules folder"
echo "build project, make budle.js file in src/public "
rem https://ss64.com/nt/cmd.html
rem start /wait cmd /k npm install / 
rem npm install /wait npm run-script build
SET mypath=%~dp0
echo %mypath:~0,-1%
rem npm install & npm run-script build & start firefox file:///%mypath%/src/client/index.html & start notepad %mypath%/src/client/app/index.jsx 
npm install & npm run-script build
rem npm run-script build
rem https://stackoverflow.com/questions/3827567/how-to-get-the-path-of-the-batch-script-in-windows
rem https://serverfault.com/questions/245393/how-do-you-wait-for-an-exe-to-complete-in-batch-file
rem start /wait cmd /k npm run-script build 
rem start firefox file:///%mypath%/src/client/index.html






