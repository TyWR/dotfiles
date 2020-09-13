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
    return if output > 80
        "MEM[|||||]"
    else if output > 60
        "MEM[||||·]"
    else if output > 40
        "MEM[|||··]"
    else if output > 20
        "MEM[||···]"
    else
        "MEM[|····]"

update: (output, el) ->
  $(".mem span", el).html(@bar(output))

style: """
  font:17px "Terminus (TTF)"
  font-weight: bold
  top: 0px
  right: 80px
"""
