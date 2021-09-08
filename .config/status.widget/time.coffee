commands =
  colors: 'echo "$(~/.config/status.widget/scripts/switcher.sh 2>/dev/null)"'
  time: 'date +\"%H:%M\"'

command: "echo " + "$(#{ commands.time }):::" + "$(#{ commands.colors })"

refreshFrequency: 50000 # ms

render: (output) ->
  """
  <div>
      <div class="time">
        <span></span>
      </div>
  </div>
  """

update: (output, el) ->
  [time, _, bg, hl] = output.split ":::"
  $(".time span").text("#{time }")
  $(".time").css("background-color", "#{ bg }")
  $(".time").css("border-color", "#{ hl }")

style: """
    background-color: rgba(0,0,0,0)
    z-index: -1
    width: 100%

  .time
      margin-top: 0px
      padding-top: 0px
      padding-bottom: 3px
      margin-left: 0px
      margin-right: 0px
      height: 20px
      font: 20px "Terminus (TTF)"
      z-index: -1
      text-align: center
"""
