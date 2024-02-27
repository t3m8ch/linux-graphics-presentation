format $filename:
    #!/bin/sh
    title=`sed -n 's/^# \(.*\)/\1/p' $filename | head -n1`
    printf "$(< template.html)\n" "$title" "$filename" > index.html

serve filename port="8000": (format filename)
    python3 -m http.server {{port}}
