# Accessing the "magick" package
library("magick")

# Creating a vector for the counts
counts <- 1 : 5 %>% as.character()

# Reading in images to be used in the meme while adding effects and cropping/scaling as necessary
flatworm_image <- image_read("https://cdn.discordapp.com/attachments/697805929370091671/955089013075767326/pixilart-drawing.png") %>%
  image_scale(75)

archworm_image <- image_read("https://cdn.discordapp.com/attachments/697805929370091671/955089815349641216/pixilart-drawing_1.png") %>%
  image_scale(75)

surprise_image <- image_read("https://mario.wiki.gallery/images/d/dd/BooHoops.png") %>%
  image_scale(100) %>%
  image_negate()

dirt_image <- image_read("https://previews.123rf.com/images/argus456/argus4561309/argus456130900186/21883630-%EA%B7%B8%EA%B2%83%EC%97%90-%EC%9D%BC%EB%B6%80-%EB%AF%B8%EC%84%B8-%EC%9E%85%EC%9E%90%EC%99%80-%ED%86%A0%EC%96%91-%ED%9D%99%EC%9D%98-%EC%A7%88%EA%B0%90.jpg") %>%
  image_scale("100x100")

# Creating each frame and adding text
# The counts vector was used for the countdown
frame1 <- image_composite(dirt_image, flatworm_image, offset = "+18+12")

frame2 <- image_composite(dirt_image, archworm_image, offset = "+16+12") %>%
  image_annotate(text = "KEEP", size = 25, gravity = "northwest", color = "white")

frame3 <- image_composite(dirt_image, flatworm_image, offset = "+14+12") %>%
  image_annotate(text = "YOUR", size = 25, gravity = "northwest", color = "white")

frame4 <- image_composite(dirt_image, archworm_image, offset = "+12+12") %>%
  image_annotate(text = "FOCUS", size = 25, gravity = "northwest", color = "white")

frame5 <- image_composite(dirt_image, flatworm_image, offset = "+10+12") %>%
  image_annotate(text = counts[5], size = 25, gravity = "southeast", color = "white")

frame6 <- image_composite(dirt_image, archworm_image, offset = "+8+12") %>%
  image_annotate(text = counts[4], size = 25, gravity = "southeast", color = "white")

frame7 <- image_composite(dirt_image, flatworm_image, offset = "+6+12") %>%
  image_annotate(text = counts[3], size = 25, gravity = "southeast", color = "white")

frame8 <- image_composite(dirt_image, archworm_image, offset = "+4+12") %>%
  image_annotate(text = counts[2], size = 25, gravity = "southeast", color = "white")

frame9 <- image_composite(dirt_image, flatworm_image, offset = "+2+12") %>%
  image_annotate(text = counts[1], size = 25, gravity = "southeast", color = "white")

frame10 <- surprise_image %>%
  image_annotate(text = "BOO!", size = 30, gravity = "southeast", color = "red")

# Using a vector to put the frames in order
frames <- c(frame1, frame2, frame3, frame4, frame5, frame6, frame7, frame8, frame9, frame10)

# Creating an animation
worm <- image_animate(frames, fps = 1)

# Saving the animation as a gif
image_write(worm, "savedFiles/worm.gif")