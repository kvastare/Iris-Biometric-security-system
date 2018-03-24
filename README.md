# Implementation of Human Iris Recognition System for Biometric Identification

*This is a project for ECE 268 Security of Hardware Embedded systems, Univeristy of California San Diego *

## Introduction

Biometrics is the automated measurement of physiological or behavioral characteristics of individuals [1]. Physiological characteristics include face, fingerprints, iris and retinal features, hand geometry, and ears. Behavioral characteristics include handwritten signature, voice, keystrokes (typing), and gait (how a person walks).

Today there are many uses of biometrics each has its own advantages and disadvantages according to the requirements on biometric identifiers. A practical biometric system should have acceptable recognition accuracy, speed with reasonable resource requirements. It should be harmless to users, be accepted by the intended population, and be sufficiently robust to various fraudulent methods [1].

A front-on view of the iris is shown in Figure 1. Formation of the unique patterns of the iris is random and not related to any genetic factors
[4]. The average diameter of the iris is 12 mm, and the pupil size can vary from 10 \% to 80 \% of the iris diameter[2]. The iris consists of a number of layers the lowest is the epithelium layer, which contains dense pigmentation cells. The stromal layer lies above the epithelium layer, and contains blood vessels, pigment cells and the two iris muscles. The density of stromal pigmentation determines the color of the iris. The externally visible surface of the multilayered iris contains two zones, which often differ in color [3]. 

## Literature Survey

Iris recognition is one of the biometrics that is used for identification and verification due to its accuracy. In a verification system, the system authenticates a person’s identity by comparing the captured biometric characteristic with her own biometric template(s) prestored in the system.
In an identification system, the system recognizes an individual by searching the entire template database for a match [1]. In this report we will describe the physiology of the iris, the algorithm used in iris recognition, analyze their performance and state some areas that use the iris biometric. Figure 2 depicts the block diagram of the system implemented.

Most of the currently deployed commercial algorithms for iris recognition (by John Daugman [5]) have a very low false acceptance rate compared to the other biometric identifiers. Though in this project we are proposing all the possible methods of segmentation, normalization, feature encoding and matching along with their limitations. Later on, we will to improve upon the work that has already been done in this field.

### Segmentation

The iris segmentation can be broadly done in four different ways:

#### Boundary-based methods
In these methods, the systems will first find the base element pupil as the inner boundary of the iris and then work its way through other parameters such as eyelids and limbic areas, in order to separate them from the iris.

The two state of the art techniques used are: 

##### Integro-differential Operator}

Using this technique by Daugman [1], we obtained the inner and outer boundaries of the iris excluding eyelids. An effective technique was proposed by Jeong et al. [2], where two circular edge detectors are used in combination of AdaBoost filter for pupil and iris boundary detection, and their method approximated the real boundary of eyelashes and eyelid detection.

Limitations:
These methods require eye images of good quality and ideal imaging environment. Hence, they are not accurate for non-ideal conditions or visible light.

##### Houghman Transform

In this method, iris localization is performed by HT finding circularity by edge-map voting within the given range of the radius, which is known as the Wildes
approach [3].

Limitations:
This method fails in iris segmentation in case the RGB values of the eyelids are similar to the iris or pupil/eyelid detection error.

##### Pixel-based methods

These methods are based on the identification of the iris boundary using specific color texture and illumination information gradient to discriminate between an iris pixel and another pixel in the neighborhood. Based on the discriminating features, the iris classifier is created for iris and non-iris pixel classification.

The following two techniques are used:

##### 2-D Profile Lines

Using 2-D profile lines between the iris and sclera boundary, the gradient is calculated pixel-by-pixel. The maximum change is represented as the iris boundary. This method was proposed by Khan et al. [4].

Limitations:
The calculated gradient is affected by the eyelashes, and the true boundary of the iris is not found.

##### Color-based Clustering

In this particular approach, the iris boundary is approximated by color-based clustering and then, for off-angle eye images, two circular boundaries of the iris are detected and their intersection is defined as the iris boundary. The method was proposed by Parikh et al. [5].

Limitations:
Some empirical threshold is set for eyelid and eyelash detection, but the limitations in detecting the true boundary of the iris still exist.

#### Active Contour and Circle Fitting-based method

This technique was proposed by Shah et al. [6] and Abdullah et al. [7]. Here, a mask is created according to the size of the iris, the gradient is checked and then a correlative process reaches the true iris boundary with the help of localized region-based formulation process [8].
Limitations:}

This method is better for detecting pupil boundary because they can be prevented by the iris texture considering the iris pattern as the boundary.

##### CNN-based methods

It is a deep-learning based technique and it is very popular in computer vision these days. 

The two very common methods are as follows:

##### HCNNs and MFCNs based deep learning method

The method was proposed by Liu et al. [9]. In their study, hierarchical CNNs (HCNNs) and multi-scale FCNs (MFCNs) were used to locate the iris boundary automatically.

Limitations:
As they use full image into the network, the eyelids, hairs, eyebrows, and glasses frames, which look similar to iris can be considered as iris points by the CNN model.

##### Two-stage iris segmentation method

The proposed method accurately identified the true boundary even in intense scenarios, such as glasses, off-angle eyes, rotated eyes, side view, and partially opened eyes. The first stage includes bottom-hat filtering, noise removal, Canny edge detector, contrast enhancement, and modified HT to segment the approximate the iris boundary. In the second stage, deep CNN [10] with the image input of 21 × 21 pixels is used to fit the true iris boundary. By applying the second stage segmentation only within the ROI defined by the approximate iris boundary detected in the first stage, we can reduce the processing time and error of iris segmentation.

Limitations:
A large amount of data set is needed for CNN training.

