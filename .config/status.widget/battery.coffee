commands =
  colors: 'echo "$(~/.config/status.widget/scripts/switcher.sh 2>/dev/null)"'
  battery: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'| sed 's/%//'"
  charging: "pmset -g batt | grep 'AC Power' -o;"

command: "echo " + "$(#{ commands.battery }):::" + "$(#{ commands.colors }):::" + "$(#{ commands.charging })"

refreshFrequency: 3000 # ms

render: (output) ->
  """
  <div class="battery"
    <span></span>
    <span></span>
  </div>
  """

icon: (output) =>
  return if output is "AC Power\n"
    "∙>&nbsp;"
  else
    ""

bar: (output) ->
    [battery, _, _, hl, charging] = output.split ":::"
    return if battery > 90
        "#{ hl }:::#{ @icon(charging) }||||||||||"
    else if battery > 80
        "#{ hl }:::#{ @icon(charging) }||||||||"
    else if battery > 70
        "#{ hl }:::#{ @icon(charging) }||||||||"
    else if battery > 60
        "#{ hl }:::#{ @icon(charging) }|||||||"
    else if battery > 50
        "#{ hl }:::#{ @icon(charging) }||||||"
    else if battery > 40
        "#{ hl }:::#{ @icon(charging) }|||||"
    else if battery > 30
        "#{ hl }:::#{ @icon(charging) }||||"
    else if battery > 20
        "#{ hl }:::#{ @icon(charging) }|||"
    else if battery > 10
        "#{ hl }:::#{ @icon(charging) }||"
    else
        "red:::#{ @icon(charging) }|"

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
