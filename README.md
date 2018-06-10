# React "hello world"-project installation script


For Linux run shell - script ( react2018_proj_setup.sh )

For Windows run bath - script ( react_proj_setup.bat ) 



------------------------------------------------------------------------------------------------------------------------

If react_proj_setup.sh don't generate bundle.js file, then you can use react2018_proj_setup.sh.

There is something changed in babel - modules installation from internet what cause my old scrit stop generating bundle.js file.

 react2018_proj_setup.sh is modified version of react_proj_setup.sh where I decided hardcode package.json file.

 Old script is based at tutorial :

https://www.codementor.io/tamizhvendan/beginner-guide-setup-reactjs-environment-npm-babel-6-webpack-du107r9zr



How to programming on React :

src/client/index.jsx  ( react code here )

then write following command on Linux terminal to "compile" react to old javascript:

 ```js ./node_modules/.bin/webpack -d  ```

alson write following command on Windows command line (cmd) to "compile :

```js  npm run-script build  ```js

This cause src/client/public/bundle.js - file update, after that you can open your project in browser at src/client/index.html.
Remember that after compilation you can see changes in browser, because index.html read bundle.js file. This mean that if you need
to host project you need only index.html and bundle.js files. Other files are for development.


Please note that NodeJS have to be installed for both script !




