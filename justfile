format filename:
    #!/usr/bin/env python3
    import re
    with open("{{filename}}", "r", encoding="UTF-8") as f:
        m = re.search("^# (.*)", f.read())
        title = "Презентация" if m is None else m.group(1)
    with open("template.html") as f:
        template = f.read()
    with open("index.html", "w") as f:
        f.write(template % (title, "{{filename}}"))

serve filename port="8000": (format filename)
    python3 -m http.server {{port}}
