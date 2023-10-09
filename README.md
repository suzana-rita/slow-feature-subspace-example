# Slow feature subspace (SFS) example
Comparison between slow feature subspace and traditional subspaces using Matlab.

<div align="center">
  <img src="https://github.com/suzana-rita/slow-feature-subspace-example/blob/9fd34c02c794f52594ddb4806b8261b25c672929/problem-explanation-graph.png" width="700px">
  <p style="font-size:1.5vw;"> Figure 1. Comparison between traditional subspaces and slow feature subspaces representations</p>
</div>


This figure shows a comparison between the conventional PCA-based subspace (Figure a) and our SFS (Figure b). In this example, we compare two videos: one for "close hand" and another for "open hand". The "open hand" sample contains the same frames as "close hand" video, but in reversed order. Additionally, the subspace similarity is employed as a metric to quantify the difference between subspaces. A higher similarity score indicates greater equivalence, with 1.0 representing identical subspaces. In contrast, a similarity score smaller than 1.0 indicates that the subspaces are different. As shown in Figure a), conventional subspaces created from different videos based on the same frames have a similarity of 1.0, which means these subspaces are equal. On the other hand, Figure b) illustrates that the slow feature subspaces are different, with a similarity score of 0.77. Unlike conventional subspaces, our slow feature subspaces can distinguish sequential differences even when the videos have the same frames in reversed order.

# Code

In our Matlab code, the main.m file has two sections. The first one is a simple slow feature subspace generation, and the second one demonstrates the above comparison. I hope these examples are helpful!

# Citations

If you use our code, please consider citing our work:
```
@article{beleza2023slow,
  title={Slow feature subspace: A video representation based on slow feature analysis for action recognition},
  author={Beleza, Suzana Rita Alves and Shimomoto, Erica K and Souza, Lincon S and Fukui, Kazuhiro},
  journal={Machine Learning with Applications},
  volume={14},
  pages={100493},
  year={2023},
  publisher={Elsevier}
}
@inproceedings{beleza2021slow,
  title={Slow feature subspace for action recognition},
  author={Beleza, Suzana R. A. and Fukui, Kazuhiro},
  booktitle={Pattern Recognition. ICPR International Workshops and Challenges: Virtual Event, January 10--15, 2021, Proceedings, Part III},
  pages={702--716},
  year={2021},
  organization={Springer}
}
```