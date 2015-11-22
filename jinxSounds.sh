#/bin/bash
JINX_SOUND_FOLDER="/home/raison/scripts/jinx/sounds/"

JINX_ATTACK[0]="Jinx.attack01.ogg"
JINX_ATTACK[1]="Jinx.attack02.ogg"
JINX_ATTACK[2]="Jinx.attack03.ogg"
JINX_ATTACK[3]="Jinx.attack04.ogg"
JINX_ATTACK[4]="Jinx.attack05.ogg"
JINX_ATTACK[5]="Jinx.attack06.ogg"
JINX_ATTACK[6]="Jinx.attack07.ogg"
JINX_ATTACK[7]="Jinx.attack08.ogg"
JINX_ATTACK[8]="Jinx.attack09.ogg"
JINX_ATTACK[9]="Jinx.attack10.ogg"
JINX_ATTACK[10]="Jinx.attack12.ogg"
JINX_ATTACK[11]="Jinx.attack13.ogg"
JINX_ATTACK[12]="Jinx.attack14.ogg"
JINX_ATTACK[13]="Jinx.attack15.ogg"
JINX_ATTACK[14]="Jinx.attack16.ogg"

JINX_TAUNT[0]="Jinx.Caitlyntaunt01.ogg"
JINX_TAUNT[1]="Jinx.Caitlyntaunt02.ogg"
JINX_TAUNT[2]="Jinx.taunt03.ogg"

JINX_DYING[0]="Jinx.dying02.ogg"
JINX_DYING[1]="Jinx.dying.ogg"

JINX_JOKE[0]="Jinx.Joke01.ogg"
JINX_JOKE[1]="Jinx.Joke02.ogg"
JINX_JOKE[2]="Jinx.Joke03.ogg"
JINX_JOKE[3]="Jinx.Joke04.ogg"

JINX_LAUGH[0]="Jinx.laugh01.ogg"
JINX_LAUGH[1]="Jinx.laugh02.ogg"
JINX_LAUGH[2]="Jinx.laugh03.ogg"
JINX_LAUGH[3]="Jinx.laugh04.ogg"

JINX_MOVE[0]="Jinx.move03.ogg"
JINX_MOVE[1]="Jinx.move04.ogg"
JINX_MOVE[2]="Jinx.move05.ogg"
JINX_MOVE[3]="Jinx.move07.ogg"
JINX_MOVE[4]="Jinx.move08.ogg"
JINX_MOVE[5]="Jinx.move19.ogg"
JINX_MOVE[6]="Jinx.R3.ogg"

JINX_SELECTED[0]="Jinx_Select.ogg"


playRandomInRepo(){
  case $1 in
    0)
      jinxPlaySound attack $((RANDOM % ${#JINX_ATTACK[@]}))
    ;;
    1)
      jinxPlaySound taunt $((RANDOM % ${#JINX_TAUNT[@]}))
    ;;
    2)
      jinxPlaySound dying $((RANDOM % ${#JINX_DYING[@]}))
    ;;
    3)
      jinxPlaySound joke $((RANDOM % ${#JINX_JOKE[@]}))
    ;;
    4)
      jinxPlaySound laugh $((RANDOM % ${#JINX_LAUGH[@]}))
    ;;
    5)
      jinxPlaySound move $((RANDOM % ${#JINX_MOVE[@]}))
    ;;
    *)
      jinxPlaySound selected 0
    ;;
  esac
}

jinxPlaySound(){
  cmd=""
  if [ -z $2 ] ;then
    case $1 in
      attack)
        playRandomInRepo 0
      ;;
      taunt)
        playRandomInRepo 1
      ;;
      dying)
        playRandomInRepo 2
      ;;
      joke)
        playRandomInRepo 3
      ;;
      laugh)
        playRandomInRepo 4
      ;;
      move)
        playRandomInRepo 5
      ;;
      selected)
        playRandomInRepo 6
      ;;
      *)
        playRandomInRepo $((RANDOM % 6))
      ;;
    esac
  else
    case $1 in
      attack)
        cmd="paplay $JINX_SOUND_FOLDER${JINX_ATTACK[$2]}"
      ;;
      taunt)
        cmd="paplay $JINX_SOUND_FOLDER${JINX_TAUNT[$2]}"
      ;;
      dying)
        cmd="paplay $JINX_SOUND_FOLDER${JINX_DYING[$2]}"
      ;;
      joke)
        cmd="paplay $JINX_SOUND_FOLDER${JINX_JOKE[$2]}"
      ;;
      laugh)
        cmd="paplay $JINX_SOUND_FOLDER${JINX_LAUGH[$2]}"
      ;;
      move)
        cmd="paplay $JINX_SOUND_FOLDER${JINX_MOVE[$2]}"
      ;;
      selected)
        cmd="paplay $JINX_SOUND_FOLDER${JINX_SELECTED[$2]}"
      ;;
      *)
        playRandomInRepo $((RANDOM % 6))
      ;;
    esac
    echo "$cmd"
    $cmd &
  fi
}

jinxPlaySound $1 $2
