#!/bin/bash

mvn clean install --settings travis/settings.xml findbugs:findbugs site
