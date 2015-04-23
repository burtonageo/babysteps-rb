#! /usr/bin/env ruby

#> Given:
# A git repo: hello.git
#     With uncommitted changes
#     The last commit is less than X seconds ago from now
# A number x

#> When X seconds have elapsed since the last commit and there are uncommitted changes:
# All uncommitted changes will be reverted

#> Then:
# There should be no uncommited changes

git_repo = ARGV[0]
num_seconds = ARGV[1]

`git --git-dir=#{git_repo}/.git --work-tree=#{git_repo} reset --hard HEAD`

#> Given:
# A git repo in a different directory: ../otherrepo/hello.git
#    With uncommitted changes
#    The last commit is less than X seconds ago from now
# A number x

#> When X seconds have elapsed since the last commit and there are uncommitted changes:
# All uncommitted changes will be reverted

#> Then:
# There should be no uncommited changes

#> Given
# A git repo: hello.git
# A number x
# With no uncommitted changes

#> When
# x seconds have passed since this script has called
# No modifications to the repo have been made

#> Then
# The repository should be unchanged



#take_baby_steps . 120

#Max(X seconds since the last commit, X seconds since script ran) > 120  -> Revert



# Get a git directory and number of seconds (= x)


# After x seconds from now have elapsed, revert any
# uncommitted changes in the repository
