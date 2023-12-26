# test the fcgqcnn on a single object
fcgqcnn_single_object:
	python examples/policy.py FC-GQCNN-4.0-PJ --fully_conv --depth_image data/examples/single_object/primesense/depth_7.npy --segmask data/examples/single_object/primesense/segmask_7.png --camera_intr data/calib/phoxi/phoxi.intr

