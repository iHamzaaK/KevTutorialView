# KevTutorialView
Tutorial Screen made in swift using VFL. Very basic and easy to use

# Step 1 -
https://cloud.githubusercontent.com/assets/10392416/20513233/74e70eec-b0a6-11e6-8e97-b4522e2ca9ba.png
Drag and drop a UIView in a viewController

# Step 2 - 
https://cloud.githubusercontent.com/assets/10392416/20513234/74e82c0a-b0a6-11e6-95b3-68aaf149b576.png
After giving constraints, go to identity inspector and write kevTutorialView in custom Class bar.

# Step 3 - 
https://cloud.githubusercontent.com/assets/10392416/20513235/74e96f7a-b0a6-11e6-85b1-175ba72fafae.png
https://cloud.githubusercontent.com/assets/10392416/20513237/74ea7244-b0a6-11e6-8f01-e4e5b5fd2684.png
https://cloud.githubusercontent.com/assets/10392416/20513236/74e99efa-b0a6-11e6-8611-dfaca4dd7302.png
Create an Iboutlet and write you images name u want to display in arrTutorialImage
     @IBOutlet   var kevView : kevTutorialView!
    kevView.arrTutorialImage = ["imageOne","imageTwo","imageThree","imageFour","imageFive"]
