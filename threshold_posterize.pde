
PImage threshold(PImage img)
{
    img.filter(THRESHOLD);
    return img;
}

PImage posterize(PImage img)
{
    img.filter(POSTERIZE,5);
    return img;
}
