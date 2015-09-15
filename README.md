# default-structure-generator
Creates a default directory structure with some of the basics files for a basic web application.

---------------------------------------
###Usage
```
$ sudo chmod + default-structure-generator.sh # Permission for execution
$ ./default-structure-generator.sh # Execute on the folder where the project will be on.
```
---------------------------------------

###Structure generated
####For LESS
```
.
├── assets
│   ├── coffeescript
│   ├── css
│   ├── images
│   ├── js
│   │   ├── lib
│   │   ├── main.js
│   │   └── plugins
│   └── less
│       ├── components
│       ├── lib
│       └── main.less
└── README.md
```

####For SASS
```
.
├── assets
│   ├── coffeescript
│   ├── css
│   ├── images
│   ├── js
│   │   ├── lib
│   │   ├── main.js
│   │   └── plugins
│   └── sass
│       ├── components
│       ├── lib
│       └── main.sass
└── README.md
```

####When the preprocessor isn't mentioned by the user.
```
.
├── assets
│   ├── css
│   ├── images
│   └── js
│       ├── lib
│       ├── main.js
│       └── plugins
└── README.md
```
