# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/marek/Projects/fanabulous/backend/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/marek/Projects/fanabulous/backend/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/marek/Projects/fanabulous/backend/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/marek/Projects/fanabulous/backend/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/marek/Projects/fanabulous/backend/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/marek/Projects/fanabulous/backend/node_modules/tabtab/.completions/slss.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/terraform/0.11.13/bin/terraform terraform
