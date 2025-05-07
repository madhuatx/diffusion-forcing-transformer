#export HIP_VISIBLE_DEVICES=0,1

python -m main +name=single_image_to_long \
dataset=realestate10k_mini \
algorithm=dfot_video_pose \
experiment=video_generation \
@diffusion/continuous \
load=pretrained:DFoT_RE10K.ckpt 'experiment.tasks=[validation]' \
experiment.validation.data.shuffle=True \
dataset.context_length=1 \
dataset.frame_skip=1 \
dataset.n_frames=200 \
algorithm.tasks.prediction.keyframe_density=0.0625 \
algorithm.tasks.interpolation.max_batch_size=1 \
experiment.validation.batch_size=1 \
algorithm.tasks.prediction.history_guidance.name=stabilized_vanilla \
+algorithm.tasks.prediction.history_guidance.guidance_scale=4.0 \
+algorithm.tasks.prediction.history_guidance.stabilization_level=0.02  \
algorithm.tasks.interpolation.history_guidance.name=vanilla \
+algorithm.tasks.interpolation.history_guidance.guidance_scale=1.5