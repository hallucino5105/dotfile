# Print the date full (e.g. Sun 00/00/00 00:00:00)

run_segment() {
    LANG=C date +"%Y/%m/%d (%a) %H:%M"
    return 0
}
