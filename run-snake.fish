#!/usr/bin/env fish
cd (dirname (status filename))
mvn -pl snake-app-linux dependency:build-classpath -Dmdep.outputFile=/tmp/snake_cp.txt -q
set CP (cat /tmp/snake_cp.txt)":snake-app-linux/target/classes:snake-ui/target/classes:snake-ui-linux/target/classes:snake-backend-openrazer/target/classes:snake-lib/target/classes:snake-widgets/target/classes"
java --module-path "$CP" --add-modules ALL-MODULE-PATH -cp "$CP" uk.co.bithatch.snake.app.linux.App
