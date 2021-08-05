import numpy as np
import cv2

# cap = cv2.VideoCapture('vtest.avi')
fgbg = cv2.bgsegm.createBackgroundSubtractorMOG()

# while True:

#     ret, frame = cap.read()
#     if ret == False: break

#     fgmask = fgbg.apply(frame)
    
#     cv2.imshow('fgmask',fgmask)
#     cv2.imshow('frame',frame)
    
#     k = cv2.waitKey(30) & 0xFF
#     if k == 27:
#         break
# cap.release()
# cv2.destroyAllWindows()

_IMAGE = "2_swing0.tif"
img = cv2.imread(_IMAGE)

fgmask = fgbg.apply(img)
cv2.imwrite("test.tif", fgmask)