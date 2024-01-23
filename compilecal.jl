using Pkg
Pkg.activate(".")
Pkg.instantiate()
using CourseCalendar

calfile = joinpath(pwd(), "S24", "calendar.toml")
topics = joinpath(pwd(), "S24", "topics.txt")
sched = courseSchedule(calfile, topics)

md = mdcalendar(sched)

hdg = """---
title: "Daily schedule"
layout: page
nav_order: 1
has_children: true
---


Deadlines to note:


- ✏️ Class preparation includes written assignment
- 🔬 In-class assessment
- 📜  Portfolio assignment due




"""

open(joinpath(pwd(), "docs", "schedule", "index.md"), "w") do io
    write(io, hdg * md)
end