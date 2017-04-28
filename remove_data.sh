#!/bin/bash
echo "remove all project data except 2 shell files";
#rm -rf -not "remove_data.sh" -not "react_proj_setup.sh"; 
rm webpack.config.js
rm package.json
rm -r node_modules
rm -r src
rm .babelrc
