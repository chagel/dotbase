abbr a gcalcli
abbr aa gcalcli agenda
abbr am gcalcli calm
abbr an gcalcli --calendar='chagel@gmail.com' quick
abbr aw gcalcli calw
abbr aws-ec2 "aws ec2 describe-instances --output table --query \"Reservations[].Instances[].{Name:Tags[?Key=='Name'].Value | [0],InstanceID:InstanceId,InstanceType:InstanceType,PublicIP:PublicIpAddress,State:State.Name,PrivateIP:NetworkInterfaces[0].PrivateIpAddress}\""
abbr aws-users aws iam list-users --output table
abbr b bat
abbr be bundle exec
abbr bea bundle exec rails
abbr bec bundle exec rails c
abbr bed bundle exec rake db:migrate
abbr beg bundle exec guard
abbr bek bundle exec rake
abbr bes bin/rails s -p3000
abbr bet RAILS_ENV=test bundle exec rake db:drop db:create db:migrate
abbr c clear
abbr dpaste curl -s -F "content=<-" https://dpaste.com/api/v2/
abbr e vim
abbr f fzf
abbr h history
abbr install brew install
abbr l ls -la
abbr lg "ls -la | grep"
abbr ll ls -lG
abbr lt "ls -lGt | head"
abbr m timew
abbr mgst mgitstatus
abbr mm timew month
abbr mslm timew summary :lastmonth
abbr msm timew summary :month
abbr mux tmuxinator
abbr mw timew week
abbr mxlm "timew export :lastmonth | ~/.timewarrior/extensions/to-csv"
abbr mxm "timew export :month | ~/.timewarrior/extensions/to-csv"
abbr n nautilus
abbr nn nnn -d -T t
abbr note vim -c 'edit note:$1'
abbr notes vim -c 'RecentNotes'
abbr ns "ls -c $NPATH | egrep -i $1"
abbr reload source ~/.config/fish/config.fish
abbr t task
abbr ta tmux attach-session -t
abbr tl tmux list-session
abbr tm task long due.before:sonm
abbr tn task add
abbr tnt task add due:eod
abbr tt task ls due.before:tomorrow
abbr tw task ls due.before:soww
abbr uc uncommitted
abbr uninstall brew remove
abbr upgrade-system brew upgrade
abbr vg vim Gemfile
abbr vim nvim
abbr vit vim ~/.tmux.conf
abbr ws ruby -run -ehttpd . -p 8000
abbr gct "git diff HEAD | llm -t git | git commit -e -F -"
