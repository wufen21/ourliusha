cd/d  %~dp0
set  MAVEN_OPTS=-Xmx1024m -Xdebug  -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=12345
-javaagent:src/tools/springloaded-1.2.3.RELEASE.jar -noverify
mvn tomcat7:run -Dmaven.test.skip=true 