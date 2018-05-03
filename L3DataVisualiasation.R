#Library Section-----------------------------------------------
library(tidyverse)


#First Step---------------------------------------------------
#Use mpg dataset
mpg#See the dataset preview
?mpg#See the details of the mpg dataset,like each variable means

#Create ggplot by scatterplo
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ,y = hwy))

#A graphing template is like below
#ggplot(data = <dataset>)+
# <GEOM_function>(mapping = aes(<MAPPINGS>))

#Show summary of mpg dataset
str(mpg)
#Make a sccatterplot hwy vs cyl
#CYL means 汽缸
ggplot(data = mpg)+
  geom_point(mapping = aes(x = hwy, y = cyl))

#Aesthetic mapping-----------------------------------------
#Use color as the class(colour and color is the same in aes())
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ,y = hwy, color = class))

#Use condition to lable the color
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ,y = hwy, color = displ<5))

#Shape will show 6 different values
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ,y = hwy, shape = class))
#Size suppose to use continuous values
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ,y = hwy, size = class))

#Split plot into facet  -----------------------------------------
#facet_wrap() for single variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap( ~class, nrow = 2)

#facet_grid() for combination of two variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv~cyl)

#no row use '.' instead of 'drv'
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(.~cyl)

#no col use '.' instead of 'cyl'
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv~.)


#Geometric objects----------------------------------------
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
#add linetype to classify different class
#splite cars into three lines
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
#group just split dataset won't tell you which one is in drv
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
#while color will give the legend
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv))
#you can use show.legend=false to omit the legend
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),show.legend=F)

#Multiple layer by using '+'
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
#As simple you could put the 'Mapping' into the ggplot() function
#The plot is the same like above but user friendly
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
#By this writing styles, you can change the plot themes as you wish in different layers
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(mapping = aes(color = class))
#Use Filter() to separete the dataset 
# se false not to show the conditional line
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "suv"), se = FALSE)

#Statistical transformations--------------------------------------


