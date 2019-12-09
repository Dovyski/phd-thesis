Game-calibrated and user-tailored remote detection of emotions
============================

![Game-calibrated and user-tailored remote detection of emotions: A non-intrusive, multifactorial camera-based approach for detecting stress and boredom of players in games](https://www.fernandobevilacqua.com/public/img/readmind-hero.jpg)

## Details

> Game-calibrated and user-tailored remote detection of emotions: a non-intrusive, multifactorial camera-based approach for detecting stress and boredom of players in games

PhD thesis authored by [Fernando Bevilacqua](https://fernandobevilacqua.com) from September 2015 to November 2018, in the [PhD programme in Informatics](http://www.his.se/en/Research/informatics/Informatics/) of the [University of Skövde](https://his.se), Sweden. Defended on the 19th of November, 2018.

* _Contact:_ Fernando Bevilacqua  - dovyski@gmail.com
* _Bibliographic details:_ [urn.kb.se/resolve?urn=urn:nbn:se:his:diva-16347](http://urn.kb.se/resolve?urn=urn:nbn:se:his:diva-16347)
* _PDF version:_ [download (32Mb)](http://his.diva-portal.org/smash/get/diva2:1259426/FULLTEXT01.pdf)

## Citation

Please cite using the following BibTex entry:

```
@phdthesis{bevilacqua2018game,
   author = {Bevilacqua, Fernando},
   institution = {University of Skövde, School of Informatics},
   institution = {University of Skövde, The Informatics Research Centre},
   note = {This work has been performed with support from: CNPq, Conselho Nacional de DesenvolvimentoCientífico e Tecnológico - Brasil; University of Sk{\"o}vde; EU Interreg {\"O}KS project Game Hub Scandinavia; UFFS, Federal University of Fronteira Sul.},
   pages = {170},
   publisher = {University of Skövde},
   school = {University of SkövdeUniversity of Skövde, School of Informatics, The Informatics Research Centre},
   title = {Game-calibrated and user-tailored remote detection of emotions : A non-intrusive, multifactorial camera-based approach for detecting stress and boredom of players in games},
   series = {Dissertation Series},
   number = {27},
   ISBN = {978-91-984187-9-8},
   year = {2018}
}
```

## Abstract

Questionnaires and physiological measurements are the most common approach used to obtain data for emotion estimation in the field of human-computer interaction (HCI) and games research. Both approaches interfere with the natural behavior of users. Initiatives based on computer vision and the remote extraction of user signals for emotion estimation exist, however they are limited. Experiments of such initiatives have been performed under extremely controlled situations with few game-related stimuli. Users had a passive role with limited possibilities for interaction or emotional involvement, instead of game-based emotion stimuli, where users take an active role in the process, making decisions and directly interacting with the media. Previous works also focus on predictive models based on a group perspective. As a consequence, a model is usually trained from the data of several users, which in practice describes the average behavior of the group, excluding or diluting key individualities of each user. In that light, there is a lack of initiatives focusing on non-obtrusive, user-tailored emotion detection models, in particular regarding stress and boredom, within the context of games research that is based on emotion data generated from game stimuli. This research aims to fill that gap, providing the HCI and the games research community with an emotion detection process that can be used to remotely study user's emotions in a non-obtrusive way within the context of games. The main knowledge contribution of this research is a novel process for emotion detection that is non-obtrusive, user-tailored and game-based. It uses remotely acquired signals, namely, heart rate (HR) and facial actions (FA), to create a user-tailored model, i.e. trained neural network, able to detect the emotional states of boredom and stress of a given subject. The process is automated and relies on computer vision and remote photoplethysmography (rPPG) to acquire user signals, so that specialized equipment, e.g. HR sensors, is not required and only an ordinary camera is needed. The approach comprises two phases: training (or calibration) and testing. In the training phase, a model is trained using a user-tailored approach, i.e. data from a given subject playing calibration games is used to create a model for that given subject. Calibration games are a novel emotion elicitation material introduced by this research. These games are carefully designed to present a difficulty level that constantly and linearly progresses over time without a pre-defined stopping point. They induce emotional states of boredom and stress, accounting for particularities at an individual level. Finally, the testing phase occurs in a game session involving a subject playing any ordinary, non-calibration game, e.g. Super Mario. During the testing phase, the subject's signals are remotely acquired and fed into the model previously trained for that particular subject. The model subsequently outputs the estimated emotional state of that given subject for that particular testing game. The method for emotion detection proposed in this thesis has been conceived on the basis of established theories and it has been carefully evaluated in experimental setups. Results show a statistical significance classification of emotional states with a mean accuracy of 61.6%. Finally, this thesis presents a series of systematic evaluations conducted in order to understand the relation between psychophysiological signals and emotions. Facial behavior and physiological signals, i.e. HR, are analyzed and discussed as indicators of emotional states. This research reveals that individualities can be detected regarding facial activity, e.g. an increased number of facial actions during the stressful part of games. Regarding physiological signals, findings are aligned with and reinforce previous research that indicates higher HR mean during stressful situations in a gaming context. Results also suggest that changes in HR during gaming sessions are a promising indicator of stress. The method for the remote detection of emotions, presented in this thesis, is feasible, but does contain limitations. Nevertheless, it is a solid initiative to move away from questionnaires and physical sensors into a non-obtrusive, remote-based solution for the evaluation of user emotions.

## Publications

A number of manuscripts with varying relevance to the core aims of this thesis were published:

* Fernando Bevilacqua, Per Backlund, and Henrik Engström (2015). _"Proposal for NonContact Analysis of Multimodal Inputs to Measure Stress Level in Serious Games."_ In: 2015 7th International Conference on Games and Virtual Worlds for Serious Applications (VS-Games). IEEE. Institute of Electrical & Electronics Engineers (IEEE), pp. 1–4. [`DOI: 10.1109/vs-games.2015.7295783`](https://doi.org/10.1109/VS-GAMES.2015.7295783)

* Fernando Bevilacqua, Per Backlund, and Henrik Engström (2016). _"Variations of Facial Actions While Playing Games with Inducing Boredom and Stress."_ In: 2016 8th International Conference on Games and Virtual Worlds for Serious Applications (VSGAMES). IEEE. Institute of Electrical and Electronics Engineers (IEEE), pp. 1–8. [`DOI: 10.1109/vs-games.2016.7590374`](http://dx.doi.org/10.1109/VS-GAMES.2016.7590374)

* Fernando Bevilacqua, Henrik Engström, and Per Backlund (2018a). _"Accuracy Evaluation of Remote Photoplethysmography Estimations of Heart Rate in Gaming Sessions with Natural Behavior."_ In: Advances in Computer Entertainment Technology. Ed. by Adrian David Cheok, Masahiko Inami, and Teresa Romão. Cham: Springer International Publishing, pp. 508–530. ISBN: 978-3-319-76270-8. [`DOI: 10.1007/978-3-319-76270-8_35`](https://doi.org/10.1007/978-3-319-76270-8_35)

* Fernando Bevilacqua, Henrik Engström, and Per Backlund (2018c). _"Changes in heart rate and facial actions during a gaming session with provoked boredom and stress." In: Entertainment Computing 24.Supplement C, pp. 10–20. ISSN: 1875-9521. [`DOI: 10.1016/j.entcom.2017.10.004`](https://doi.org/10.1016/j.entcom.2017.10.004)

* Fernando Bevilacqua, Henrik Engström, and Per Backlund (2018b). _"Automated analysis of facial cues from videos as a potential method for differentiating stress and boredom of players in games."_ In: International Journal of Computer Games Technology 2018, p. 14. ISSN: 1687-7055. [`DOI: 10.1155/2018/8734540`](https://doi.org/10.1155/2018/8734540)

* Fernando Bevilacqua, Henrik Engström, and Per Backlund (2019). _"Game-calibrated and user-tailored remote detection of stress and boredom in games."_ In: Sensors, 19, 2877, Pages 1-43. ISSN: 1424-8220. [`DOI: 10.3390/S19132877`](https://doi.org/10.3390/s19132877)

## Acknowledgments

This work has been performed with support from Conselho Nacional de Desenvolvimento Científico e Tecnológico (CNPq), Brazil; University of Skövde; EU Interreg ÖKS Project Game Hub Scandinavia; Federal University of Fronteira Sul (UFFS).
