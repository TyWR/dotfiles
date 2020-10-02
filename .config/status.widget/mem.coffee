command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 5000 # ms

render: (output) ->
  """
  <div class="mem"
    <span></span>
    <span></span>
  </div>
  """

bar: (output) =>
    [output, _] = output.split "."
    return if output > 90
        "MEM&nbsp;||||||||||#{ output }%"
    else if output > 80
        "MEM&nbsp;||||||||&nbsp;#{ output }%"
    else if output > 70
        "MEM&nbsp;||||||||&nbsp;&nbsp;#{ output }%"
    else if output > 60
        "MEM&nbsp;|||||||&nbsp;&nbsp&nbsp;#{ output }%"
    else if output > 50
        "MEM&nbsp;||||||&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else if output > 40
        "MEM&nbsp;|||||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else if output > 30
        "MEM&nbsp;||||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else if output > 20
        "MEM&nbsp;|||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else if output > 10
        "MEM&nbsp;||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"
    else
        "MEM&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#{ output }%"

update: (output, el) ->
  $(".mem span", el).html(@bar(output))

style: """
  font:16px "VCR OSD Mono"
  top: 12px
  right: 250px
  width: 100%
  text-align: center
"""
