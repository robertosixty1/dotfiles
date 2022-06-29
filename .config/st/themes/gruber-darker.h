/* Terminal colors (16 first used in escape sequence) */
static const char* colorname[] = {
    /* 8 normal colors */
    "black",
    "red3",
    "green3",
    "yellow3",
    "blue2",
    "magenta3",
    "cyan3",
    "gray90",

    /* 8 bright colors */
    "gray50",
    "red",
    "green",
    "yellow",
    "blue",
    "magenta",
    "cyan",
    "white",

    [255] = 0,

    /* more colors can be added after 255 to use with DefaultXX */
    "#ffdd33",
    "#555555",
    "#e4e4ef", /* default foreground colour */
    "#181818", /* default background colour */
};
