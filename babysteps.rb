#! /usr/bin/env ruby

#> Given:
# A git repo in a different directory: ../otherrepo/hello.git
#    With uncommitted changes
# A number x

#> When X seconds have elapsed since the script was called
#> Then all uncommitted changes will be reverted


#> Given:
# A git repo: hello.git
#    With uncommitted changes
# A number x

#> When n seconds have elapsed since the last commit and n < x:
#> Then the uncommited changed will still be there

#> Given:
# A git repo with no uncommitted changes
# A number x
# Last iteration happened 0 seconds ago

#> When the iteration happens
#> Then the repository will reverted x seconds past start time when I make a change at 1 seconds elapsed.

#> Given:
# A git repo with no uncommitted changes
# A number x
# Last iteration happened x seconds ago

#> When the iteration happens
#> Then the repository will reverted x seconds past start time when I make a change at 1 seconds elapsed.

#> Given:
# A git repo with no uncommitted changes
# A number x
# Last iteration happened 2x seconds ago

#> When the iteration happens
#> Then the repository will reverted x seconds past start time when I make a change at 1 seconds elapsed.

#> Given:
# A git repo with no uncommitted changes
# A number x
# Last iteration happened INIFINITY seconds ago

#> When the user starts the script
#> Then the repository will reverted x seconds past start time when I make a change at 1 seconds elapsed.


git_repo = ARGV[0]
countdown = ARGV[1].to_i

#time_of_last_commit = `git log --pretty=format:%at`.to_i
#now = Time.now.to_i

#seconds_since_last_commit = now - time_of_last_commit

Iteration_info_file = "./iteration_info.txt"

def get_last_iteration()
    if !File.exists? Iteration_info_file then
        File.new Iteration_info_file
        set_last_iteration 0
    end
    return File.open(Iteration_info_file).read.to_i
end

def set_last_iteration(time)
    File.open(Iteration_info_file).write time
end

def iterate(countdown)
    time_now = Time.now.to_i
    time_since_last_iteration = get_last_iteration - time_now
    
    if time_since_last_iteration > countdown then
        `git --git-dir=#{repo}/.git --work-tree=#{repo} reset --hard HEAD`
    end
            
    set_last_iteration time_now
    sleep countdown
end


iterate(countdown)
iterate(countdown)
iterate(countdown)


#> Given
# A git repo: hello.git
# A number x
# With no uncommitted changes

#> When
# x seconds have passed since this script has called
# No modifications to the repo have been made

#> Then
# The repository should be unchanged


# Get a git directory and number of seconds (= x)


# After x seconds from now have elapsed, revert any
# uncommitted changes in the repository
