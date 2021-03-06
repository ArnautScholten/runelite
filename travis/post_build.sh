#check for findbugs warnings
if (grep 'BugInstance' **/reports/findbugs/*.xml 1> /dev/null 2>&1) then
  mainFb=$(grep -c 'BugInstance' **/reports/findbugs/main.xml)
  testFb=$(grep -c 'BugInstance' **/reports/findbugs/test.xml)
  sumFB=$(($mainFb+$testFb/2))
  curl -H "Authorization: token f13237abdd15c4028e31b05e3e12ffa1de693ea5 " --request POST --data '{"state": "failure", "context": "travis-ci/findbugs", "description": "FindBugs found '"${sumFB}"' issues!"}' https://api.github.com/repos/dotsub/vtms/statuses/${TRAVIS_COMMIT} > /dev/null
else
  curl -H "Authorization: token f13237abdd15c4028e31b05e3e12ffa1de693ea5 " --request POST --data '{"state": "success", "context": "travis-ci/findbugs", "description": "FindBugs Passed"}' https://api.github.com/repos/dotsub/vtms/statuses/${TRAVIS_COMMIT} > /dev/null
fi