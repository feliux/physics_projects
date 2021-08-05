import numpy as np
import cv2

# cap = cv2.VideoCapture(0)

kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(3,3))
fgbg = cv2.bgsegm.createBackgroundSubtractorGMG()

# while(1):
#     ret, frame = cap.read()

#     fgmask = fgbg.apply(frame)

#     cv2.imshow('org',frame)
#     cv2.imshow('frame',fgmask)
#     k = cv2.waitKey(30) & 0xff
#     if k == 27:
#         break

# cap.release()
# cv2.destroyAllWindows()

_IMAGE = "2_swing0.tif"
img = cv2.imread(_IMAGE)

fgmask = fgbg.apply(img)
cv2.imwrite("testgmg.tif", fgmask)