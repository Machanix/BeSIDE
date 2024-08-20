# BeSiDE
#### BeSiDE - Bead Size Distribution Estimator
BeSiDE (Bead Size Distribution Estimator) is the program created for estimate the size of microparticles by using many microscopic picture for analyzing before visualize in th form of various histograms and raw data.csv.  


## Running procedure 
#### 1. For running ShinyApp in user's computer locally, running the code below by using R

``` r
library(shiny)
library(shinyFiles)
shiny::runGist('https://gist.github.com/Machanix/6f3548254d54a0df65cbc8718588fd00')

```
The interface of this app will be showed as pictures below 

<img width="932" alt="App interface" src="https://github.com/user-attachments/assets/fc484297-9377-42f4-918c-b787b0cbb27b">


#### 2. Setting microscopic images that you want to analyze. 
Each picture has to rename as Img1, Img2, Img3,... before analyzing step. Notice that this version can be applied with microscopic picture with 20X or magnitude equal as 200 only.


<img width="1048" alt="Screenshot 2024-07-21 at 11 36 44 AM" src="https://github.com/user-attachments/assets/46ddaf8e-0b0d-4f5a-8097-a9823ce3399c">

 #### 3. Run "BeSIDE.R" for opening application for analyzing results
3.1 For selecting files "CLICK Browse" for choosing the all microscopic that users want to analyze all at once. After choosing, "CLICK RUN" and system will run autonomically. Please waiting until text  "Analysis is done" happened. 

3.2 Select color that you want to design the histogram graph. The selected color will be updated and applied to histogram graaph autonomically. If you want to reset color as default, you can just click "RESET" button in color part in side bar.
   
<img width="1016" alt="Screenshot 2024-07-21 at 11 33 03 AM" src="https://github.com/user-attachments/assets/5896d1c9-6f35-447a-9cbb-a22728363a47">

3.3 When users already applied the desirable color. You can download all of raw data table and all histogram plot at once by clicking "DOWNLOAD BUTTON". All files will be downloaded and compress as .zip file that users can extract and get the all data and images.

3.4 For analyzing new microscopic images, users just click "RESET" in the bottom of the app interface. All previous data and images will be eliminated and the server will be ready to analyze the new one.


-----
#### Tools
* Tool named "pliman" will be used and adapted for analyzing microscopic images inthis study.
* Tool named "colourpicker" was used for decoarating color of histogram graph
* Tool named "DT" was used for creating table in ShinyApp 
#### Links
1. https://github.com/TiagoOlivoto/pliman
2. https://github.com/daattali/colourpicker
3. https://github.com/rstudio/DT













