command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'| sed 's/%//'"

refreshFrequency: 15000 # ms

render: (output) ->
  """
  <div class="battery"
    <span></span>
    <span></span>
  </div>
  """

bar: (output) =>
    return if output > 80
        ":::| | | | |"
    else if output > 60
        ":::· | | | |"
    else if output > 40
        ":::· · | | |"
    else if output > 20
        ":::· · · | |"
    else if output > 10
        ":::· · · · |"
    else
        "red:::· · · · |"

update: (output, el) ->
    [col, bar] = @bar(output).split ":::"
    $(".battery span:first-child", el).html("#{ bar }")
    if col
        $(".battery span:first-child", el).css('color', 'red')

style: """
  .battery
    font-size: 12px
    font: 17px "Terminus (TTF)"
    font-weight: bold
    background-color: rgba(0,0,0,0)
  
  right: 20px
  top: 0px
"""
