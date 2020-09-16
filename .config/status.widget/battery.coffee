commands =
  colors: 'echo "$(~/.config/status.widget/scripts/switcher.sh 2>/dev/null)"'
  battery: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'| sed 's/%//'"

command: "echo " + "$(#{ commands.battery }):::" + "$(#{ commands.colors })"

refreshFrequency: 15000 # ms

render: (output) ->
  """
  <div class="battery"
    <span></span>
    <span></span>
  </div>
  """

bar: (output) ->
    [battery, _, _, hl] = output.split ":::"
    return if battery > 80
        "#{ hl }:::| | | | |"
    else if battery > 60
        "#{ hl }:::· | | | |"
    else if battery > 40
        "#{ hl }:::· · | | |"
    else if battery > 20
        "#{ hl }:::· · · | |"
    else if battery > 10
        "#{ hl }:::· · · · |"
    else
        "red:::· · · · |"

update: (output, el) ->
    [col, bar] = @bar(output).split ":::"
    $(".battery span:first-child", el).html("#{ bar }")
    $(".battery span:first-child", el).css("color", "#{ col }")

style: """
  .battery
    font-size: 12px
    font: 17px "Terminus (TTF)"
    font-weight: bold
    background-color: rgba(0,0,0,0)
  
  right: 20px
  top: 0px
"""
