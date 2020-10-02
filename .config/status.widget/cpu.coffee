command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 5000 # ms

render: (output) ->
  """
  <div class="cpu"
    <span></span>
    <span></span>
  </div>
  """

bar: (output) =>
    [output, _] = output.split "."
    return if output > 90
        "CPU&nbsp;||||||||||#{ output }%"
    else if output > 80
        "CPU&nbsp;||||||||&nbsp;#{ output }%"
    else if output > 70
        "CPU&nbsp;||||||||&nbsp;&nbsp;#{ output }%"
    else if output > 60
        "CPU&nbsp;|||||||&nbsp;&nbsp&nbsp;#{ output }%"
    else if output > 50
        "CPU&nbsp;||||||&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else if output > 40
        "CPU&nbsp;|||||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else if output > 30
        "CPU&nbsp;||||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else if output > 20
        "CPU&nbsp;|||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else if output > 10
        "CPU&nbsp;||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else
        "&nbsp;CPU&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"

update: (output, el) ->
  $(".cpu span", el).html(@bar(output))

style: """
  font:16px "VCR OSD Mono"
  top: 12px
  left: 250px
  width: 100%
  text-align: center
"""
