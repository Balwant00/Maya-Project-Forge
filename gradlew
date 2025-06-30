#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
APP_HOME=`dirname "$PRG"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

# For Darwin, add options to specify how the application appears in the dock
if [ `uname -s` = "Darwin" ]; then
    GRADLE_OPTS="-Xdock:name=$APP_NAME -Xdock:icon=\"$APP_HOME/media/gradle.icns\" $GRADLE_OPTS"
fi

# OS specific support.  $var _must_ be set to either true or false.
cygwin=false
msys=false
darwin=false
nonstop=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
  NONSTOP* )
    nonstop=true
    ;;
esac

# Attempt to find JAVACMD from JAVA_HOME
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
            # Use the system limit
            MAX_FD="$MAX_FD_LIMIT"
        fi
        ulimit -n $MAX_FD
        if [ $? -ne 0 ] ; then
            warn "Could not set maximum file descriptor limit: $MAX_FD"
        fi
    else
        warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
    fi
fi

# Collect all arguments for the java command, following shell quoting and substitution rules
#
# Collect all arguments for the java command, following shell quoting and substitution rules
# (If you have variables with spaces, you need to quote them like "$var" to avoid spliting)
#
# (The "eval" is used to allow args to contain quotes and variables)
#
eval set -- "$DEFAULT_JVM_OPTS" "$JAVA_OPTS" "$GRADLE_OPTS" "\"-Dorg.gradle.appname=$APP_BASE_NAME\"" -p "\"$APP_HOME\"" "$@"

# Gradle home is relative to the gradle-wrapper.jar
#
# Assume that the gradle wrapper jar is in the same directory as this script.
#
# Suppose the script is at /path/to/project/gradlew
# then the wrapper jar is at /path/to/project/gradle/wrapper/gradle-wrapper.jar
#
# The GRADLE_HOME is found relative to the script location.
#
# The wrapper jar is found, and its path passed to the bootstrap class.
#
GRADLE_WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# No matter the GRADLE_WRAPPER_JAR is a symlink or not, we need to get the real path of the jar.
# If the GRADLE_WRAPPER_JAR is a symlink, then we need to resolve it to the real path.
# And we need to do this until the path is not a symlink.
#
# (The "readlink -f" is used to get the real path of the jar)
#
if [ -x "/usr/bin/readlink" -o -x "/bin/readlink" ] ; then
    GRADLE_WRAPPER_JAR_REALPATH=`readlink -f "$GRADLE_WRAPPER_JAR"`
else
    # Fallback for systems that don't have readlink -f
    # This may not work if the path contains '..'
    (
        cd `dirname "$GRADLE_WRAPPER_JAR"`
        GRADLE_WRAPPER_JAR_REALPATH=`pwd`/`basename "$GRADLE_WRAPPER_JAR"`
    )
fi

# The bootstrap class is found, and its name passed to the java command.
#
# (The "unzip -q -c" is used to get the bootstrap class name from the wrapper jar)
#
BOOTSTRAP_CLASS_NAME=`unzip -q -c "$GRADLE_WRAPPER_JAR_REALPATH" META-INF/MANIFEST.MF | grep 'Main-Class:' | sed 's/Main-Class: //'`
# Remove trailing carriage return on windows
BOOTSTRAP_CLASS_NAME=`echo $BOOTSTRAP_CLASS_NAME | tr -d '\r'`

# Launch the Java application
#
# (The "exec" is used to replace the script process with the java command,
# to avoid the script process to be a zombie process)
#
exec "$JAVACMD" "$@" -classpath "$GRADLE_WRAPPER_JAR_REALPATH" "$BOOTSTRAP_CLASS_NAME"
