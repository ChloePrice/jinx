jinx(){
    case $1 in
        sound)
          case $2 in
            *)
              jinxPlaySound
            ;;
          esac
        ;;
    esac
}


alias g='git'
alias gcm='git commit -m'
alias gst='git status'
alias j='jinx'
