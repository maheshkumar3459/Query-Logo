# Query-Logo
This Simple bash script will query the redis key &amp; value which fetches the logo from MySQL database.


This script accepts two parameters.
 1) MySQL admin password to run query on the database
 2) User input Y/N for Installation of Redis-server and MySQL server on the Ubuntu OS 

REDIS:
Redis config and service file are attached with this script. This script will copy the config files to respective directories. 
Redis Server will start on the port 9000

MySQL:
This script accepts the admin password on the console inorder to run the query. 

Admin password will be copied in ~/.my.cnf file.

Script Usage: chmod +x query_logo.sh
              ./query_logo.sh 
              
First Output of the script: 
+--------------------------------------------------------------------------+

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@%WWWWWWWWW&@@@@@@@@@@@@@@@@@@@@@@@#WWWWWWWWW@@@@@@@@@@@@@@@|

|@@@@@@@@@WWWWWWWWWWWWWWWWWWWWW#@@@@@@@@@@@@%WWWWWWWWWWWWWWWWWWWWW&@@@@@@@@|

|@@@@@WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW@@@@|

|@@@%WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW@@@|

|@@@WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW#@@|

|@@WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW@@|

|@@WWWWWWWWWWWWWWWWWWW*              .,****      .WWWWWWWWWWWWWWWWWWWWWWW@@|

|@@WWWWWWWWWWWWWWWWWWW,          .W*    /W        .WWWWWWWWWWWWWWWWWWWWWW@@|

|@@@WWWWWWWWWWWWWWWWWW,        /W*     *W    .W,   ,WWWWWWWWWWWWWWWWWWWW#@@|

|@@@@WWWWWWWWWWWWWWWWW,   .WWWWWWWWWWWWW     WWW.   ,WWWWWWWWWWWWWWWWWW&@@@|

|@@@@@#WWWWWWWWWWWWWWW,  //WWWWWWWWWWWW     .....    *WWWWWWWWWWWWWWWW@@@@@|

|@@@@@@&WWWWWWWWWWWWWW,  /WW**   ..WWW                *WWWWWWWWWWWWWW@@@@@@|

|@@@@@@@@%WWWWWWWWWWWW*      ,.  ,        *WWWWWWW/    /WWWWWWWWWW&@@@@@@@@|

|@@@@@@@@@@@WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW&@@@@@@@@@@|

|@@@@@@@@@@@@@@WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW&@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@WWWWWWWWWWWWWWWWWWWWWWWWWWWWWW#@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@#WWWWWWWWWWWWWWWWWWWWWWWWW@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@%WWWWWWWWWWWWWWWWWWW@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@WWWWWWWWWWWWWW%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%WWWWWWWWW@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@WWWW%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

+--------------------------------------------------------------------------+

Replace all W with (

+--------------------------------------------------------------------------+

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@%(((((((((&@@@@@@@@@@@@@@@@@@@@@@@#(((((((((@@@@@@@@@@@@@@@|

|@@@@@@@@@(((((((((((((((((((((#@@@@@@@@@@@@%(((((((((((((((((((((&@@@@@@@@|

|@@@@@(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((@@@@|

|@@@%(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((@@@|

|@@@((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((#@@|

|@@((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((@@|

|@@(((((((((((((((((((*              .,****      .(((((((((((((((((((((((@@|

|@@(((((((((((((((((((,          .(*    /(        .((((((((((((((((((((((@@|

|@@@((((((((((((((((((,        /(*     *(    .(,   ,((((((((((((((((((((#@@|

|@@@@(((((((((((((((((,   .(((((((((((((     (((.   ,((((((((((((((((((&@@@|

|@@@@@#(((((((((((((((,  //((((((((((((     .....    *((((((((((((((((@@@@@|

|@@@@@@&((((((((((((((,  /((**   ..(((                *((((((((((((((@@@@@@|

|@@@@@@@@%((((((((((((*      ,.  ,        *(((((((/    /((((((((((&@@@@@@@@|

|@@@@@@@@@@@((((((((((((((((((((((((((((((((((((((((((((((((((((&@@@@@@@@@@|

|@@@@@@@@@@@@@@((((((((((((((((((((((((((((((((((((((((((((((&@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@(((((((((((((((((((((((((((((((((((((((((@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@((((((((((((((((((((((((((((((((((((@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@((((((((((((((((((((((((((((((#@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@#(((((((((((((((((((((((((@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@%(((((((((((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@((((((((((((((%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%(((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@((((%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

+--------------------------------------------------------------------------+
