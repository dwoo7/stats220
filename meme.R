# Accessing the "magick" package
library("magick")

# Reading in images to be used in the meme while adding effects and cropping/scaling as necessary
dumb_patrick <- image_read("https://i.pinimg.com/564x/a0/10/51/a010513509364b4362e8660c3bc1c0c7.jpg") %>%
  image_scale(500) %>%
  image_negate()

lost_patrick <- image_read("https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters/large/2800/Patrick-Star.SpongeBob-SquarePants.webp") %>%
  image_scale(500) %>%
  image_blur(10, 5)

learning_patrick <- image_read("https://preview.redd.it/kap0dlkydf941.png?width=640&crop=smart&auto=webp&s=d6bb91f72d44c2c51f263ac663bbae016e6b6146") %>%
  image_crop("500x500")

smart_patrick <- image_read("https://cdn.spongebobwiki.org/thumb/3/36/Patrick_SmartPants_main_image.png/1200px-Patrick_SmartPants_main_image.png") %>%
  image_crop("800x800+200") %>%
  image_scale("500x500")

sunglasses <- image_read("http://clipart-library.com/image_gallery2/Thug-Life-Sunglasses-PNG.png") %>%
  image_scale(80)

# Combining two images to use in the fourth square of the meme
sunglasses_smart_patrick <- image_composite(smart_patrick, sunglasses, offset = "+150+170")

# Adding black squares with annotation to be used in the meme
dumb_text <- image_blank(width = 500, 
                          height = 500, 
                          color = "#000000") %>%
  image_annotate(text = "Before STATS220",
                 color = "#FFFFFF",
                 size = 50,
                 font = "Impact",
                 gravity = "center")


lost_text <- image_blank(width = 500, 
                         height = 275, 
                         color = "#000000") %>%
  image_annotate(text = "After missing \n one lecture",
                 color = "#FFFFFF",
                 size = 50,
                 font = "Impact",
                 gravity = "center")

learning_text <- image_blank(width = 500, 
                             height = 500, 
                             color = "#000000") %>%
  image_annotate(text = "During STATS220 \n Tutorials",
                 color = "#FFFFFF",
                 size = 50,
                 font = "Impact",
                 gravity = "center")

smart_text <- image_blank(width = 500, 
                       height = 500, 
                       color = "#000000") %>%
  image_annotate(text = "After completing \n STATS220",
                 color = "#FFFFFF",
                 size = 50,
                 font = "Impact",
                 gravity = "center")

#Making each row of the meme
first_row <- c(dumb_patrick, dumb_text) %>%
  image_append()

second_row <- c(lost_patrick, lost_text) %>%
  image_append()

third_row <- c(learning_patrick, learning_text) %>%
  image_append()

fourth_row <- c(sunglasses_smart_patrick, smart_text) %>%
  image_append()

# Appending the rows together to create the final meme
meme <- c(first_row, second_row, third_row, fourth_row) %>%
  image_append(stack = TRUE)

# Saving the meme as a png file within a subfile
image_write(meme, "savedFiles/my_meme.png")