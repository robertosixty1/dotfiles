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
    "#DCDCCC",
    "#555555",
    "#DCDCCC", /* default foreground colour */
    "#353535", /* default background colour */
};
