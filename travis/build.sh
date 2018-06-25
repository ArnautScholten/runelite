#!/bin/bash

mvn clean install --settings travis/settings.xml surefire-report:report
