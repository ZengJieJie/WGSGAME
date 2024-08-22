#pragma once
#include "base/ccConfig.h"
#if USE_DRAGONBONES > 0

#include "cocos/scripting/js-bindings/jswrapper/SeApi.h"

extern se::Object* __jsb_dragonBones_BaseObject_proto;
extern se::Class* __jsb_dragonBones_BaseObject_class;

bool js_register_dragonBones_BaseObject(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseObject_returnToPool);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseObject_clearPool);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseObject_setMaxCount);

extern se::Object* __jsb_dragonBones_Matrix_proto;
extern se::Class* __jsb_dragonBones_Matrix_class;

bool js_register_dragonBones_Matrix(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);

extern se::Object* __jsb_dragonBones_Transform_proto;
extern se::Class* __jsb_dragonBones_Transform_class;

bool js_register_dragonBones_Transform(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Transform_normalizeRadian);

extern se::Object* __jsb_dragonBones_TextureAtlasData_proto;
extern se::Class* __jsb_dragonBones_TextureAtlasData_class;

bool js_register_dragonBones_TextureAtlasData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TextureAtlasData_createTexture);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TextureAtlasData_getTexture);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TextureAtlasData_addTexture);

extern se::Object* __jsb_dragonBones_TextureData_proto;
extern se::Class* __jsb_dragonBones_TextureData_class;

bool js_register_dragonBones_TextureData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TextureData_getParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TextureData_setFrame);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TextureData_getRegion);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TextureData_getFrame);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TextureData_setParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TextureData_createRectangle);

extern se::Object* __jsb_dragonBones_UserData_proto;
extern se::Class* __jsb_dragonBones_UserData_class;

bool js_register_dragonBones_UserData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_UserData_getFloat);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_UserData_getFloats);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_UserData_getString);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_UserData_getInts);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_UserData_getInt);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_UserData_addInt);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_UserData_getStrings);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_UserData_addFloat);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_UserData_addString);

extern se::Object* __jsb_dragonBones_ArmatureData_proto;
extern se::Class* __jsb_dragonBones_ArmatureData_class;

bool js_register_dragonBones_ArmatureData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getBone);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_addAction);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_setUserData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getSlot);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getSkin);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_setDefaultAnimation);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_setType);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_setParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getDefaultSkin);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getMesh);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_setDefaultSkin);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getAnimationNames);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getType);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_addConstraint);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getUserData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getAABB);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getDefaultAnimation);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getAnimation);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_getConstraint);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureData_sortBones);

extern se::Object* __jsb_dragonBones_BoneData_proto;
extern se::Class* __jsb_dragonBones_BoneData_class;

bool js_register_dragonBones_BoneData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BoneData_setParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BoneData_getTransfrom);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BoneData_setUserData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BoneData_getUserData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BoneData_getParent);

extern se::Object* __jsb_dragonBones_SlotData_proto;
extern se::Class* __jsb_dragonBones_SlotData_class;

bool js_register_dragonBones_SlotData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_setUserData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_setColor);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_getUserData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_getColor);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_setBlendMode);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_getBlendMode);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_setParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_getParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_createColor);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SlotData_getDefaultColor);

extern se::Object* __jsb_dragonBones_DragonBonesData_proto;
extern se::Class* __jsb_dragonBones_DragonBonesData_class;

bool js_register_dragonBones_DragonBonesData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_DragonBonesData_setUserData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_DragonBonesData_getUserData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_DragonBonesData_getFrameIndices);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_DragonBonesData_getArmature);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_DragonBonesData_getArmatureNames);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_DragonBonesData_addArmature);

extern se::Object* __jsb_dragonBones_SkinData_proto;
extern se::Class* __jsb_dragonBones_SkinData_class;

bool js_register_dragonBones_SkinData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SkinData_addDisplay);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_SkinData_getDisplay);

extern se::Object* __jsb_dragonBones_BoundingBoxData_proto;
extern se::Class* __jsb_dragonBones_BoundingBoxData_class;

bool js_register_dragonBones_BoundingBoxData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BoundingBoxData_intersectsSegment);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BoundingBoxData_containsPoint);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BoundingBoxData_getType);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BoundingBoxData_setType);

extern se::Object* __jsb_dragonBones_RectangleBoundingBoxData_proto;
extern se::Class* __jsb_dragonBones_RectangleBoundingBoxData_class;

bool js_register_dragonBones_RectangleBoundingBoxData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_RectangleBoundingBoxData_rectangleIntersectsSegment);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_RectangleBoundingBoxData_getTypeIndex);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_RectangleBoundingBoxData_RectangleBoundingBoxData);

extern se::Object* __jsb_dragonBones_EllipseBoundingBoxData_proto;
extern se::Class* __jsb_dragonBones_EllipseBoundingBoxData_class;

bool js_register_dragonBones_EllipseBoundingBoxData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_EllipseBoundingBoxData_getTypeIndex);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_EllipseBoundingBoxData_ellipseIntersectsSegment);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_EllipseBoundingBoxData_EllipseBoundingBoxData);

extern se::Object* __jsb_dragonBones_PolygonBoundingBoxData_proto;
extern se::Class* __jsb_dragonBones_PolygonBoundingBoxData_class;

bool js_register_dragonBones_PolygonBoundingBoxData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_PolygonBoundingBoxData_getVertices);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_PolygonBoundingBoxData_getTypeIndex);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_PolygonBoundingBoxData_polygonIntersectsSegment);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_PolygonBoundingBoxData_PolygonBoundingBoxData);

extern se::Object* __jsb_dragonBones_AnimationData_proto;
extern se::Class* __jsb_dragonBones_AnimationData_class;

bool js_register_dragonBones_AnimationData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationData_getActionTimeline);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationData_setParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationData_setActionTimeline);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationData_getSlotCachedFrameIndices);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationData_addConstraintTimeline);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationData_getBoneCachedFrameIndices);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationData_getZOrderTimeline);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationData_setZOrderTimeline);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationData_getParent);

extern se::Object* __jsb_dragonBones_Armature_proto;
extern se::Class* __jsb_dragonBones_Armature_class;

bool js_register_dragonBones_Armature(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getBone);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getClock);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_render);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getSlot);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_setClock);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature__bufferAction);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature__addBone);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getAnimatable);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getName);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_dispose);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_invalidUpdate);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getCacheFrameRate);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getFlipY);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getFlipX);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_intersectsSegment);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_setCacheFrameRate);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature__addConstraint);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_setFlipY);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_setFlipX);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature__addSlot);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_advanceTime);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getAnimation);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getArmatureData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getEventDispatcher);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_containsPoint);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Armature_getProxy);

extern se::Object* __jsb_dragonBones_TransformObject_proto;
extern se::Class* __jsb_dragonBones_TransformObject_class;

bool js_register_dragonBones_TransformObject(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TransformObject_getOffset);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TransformObject_getGlobal);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TransformObject_getOrigin);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TransformObject_getGlobalTransformMatrix);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TransformObject_getArmature);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_TransformObject_updateGlobalTransform);

extern se::Object* __jsb_dragonBones_AnimationState_proto;
extern se::Class* __jsb_dragonBones_AnimationState_class;

bool js_register_dragonBones_AnimationState(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_isCompleted);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_play);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_fadeOut);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_getName);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_stop);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_setCurrentTime);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_getCurrentTime);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_getTotalTime);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_init);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_isFadeIn);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_addBoneMask);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_containsBoneMask);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_removeAllBoneMask);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_getAnimationData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_isFadeComplete);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_advanceTime);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_isPlaying);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_removeBoneMask);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_getCurrentPlayTimes);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AnimationState_isFadeOut);

extern se::Object* __jsb_dragonBones_Bone_proto;
extern se::Class* __jsb_dragonBones_Bone_class;

bool js_register_dragonBones_Bone(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_getOffsetMode);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_getParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_getName);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_contains);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_update);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_updateByConstraint);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_getVisible);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_init);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_invalidUpdate);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_setOffsetMode);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_setVisible);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Bone_getBoneData);

extern se::Object* __jsb_dragonBones_Slot_proto;
extern se::Class* __jsb_dragonBones_Slot_class;

bool js_register_dragonBones_Slot(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot__updateColor);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_setRawDisplayDatas);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_getVisible);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_getSlotData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_getName);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot__setZorder);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_invalidUpdate);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_getChildArmature);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_intersectsSegment);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_update);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_updateTransformAndMatrix);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_getParent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_getBoundingBoxData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_setChildArmature);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_replaceDisplayData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_containsPoint);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Slot_setVisible);

extern se::Object* __jsb_dragonBones_WorldClock_proto;
extern se::Class* __jsb_dragonBones_WorldClock_class;

bool js_register_dragonBones_WorldClock(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_WorldClock_render);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_WorldClock_clear);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_WorldClock_contains);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_WorldClock_getClock);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_WorldClock_advanceTime);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_WorldClock_setClock);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_WorldClock_getStaticClock);

extern se::Object* __jsb_dragonBones_Animation_proto;
extern se::Class* __jsb_dragonBones_Animation_class;

bool js_register_dragonBones_Animation(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_init);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_gotoAndPlayByTime);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_fadeIn);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_playConfig);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_isCompleted);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_play);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_getState);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_stop);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_getLastAnimationName);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_getLastAnimationState);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_getAnimationNames);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_advanceTime);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_isPlaying);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_gotoAndPlayByProgress);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_getAnimationConfig);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_reset);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_hasAnimation);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_gotoAndStopByTime);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_gotoAndStopByProgress);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_gotoAndPlayByFrame);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_Animation_gotoAndStopByFrame);

extern se::Object* __jsb_dragonBones_EventObject_proto;
extern se::Class* __jsb_dragonBones_EventObject_class;

bool js_register_dragonBones_EventObject(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_EventObject_getBone);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_EventObject_getData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_EventObject_getAnimationState);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_EventObject_getArmature);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_EventObject_getSlot);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_EventObject_actionDataToInstance);

extern se::Object* __jsb_dragonBones_BaseFactory_proto;
extern se::Class* __jsb_dragonBones_BaseFactory_class;

bool js_register_dragonBones_BaseFactory(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_replaceSkin);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_replaceAnimation);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_getClock);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_removeDragonBonesData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_removeTextureAtlasData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_parseDragonBonesData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_clear);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_addDragonBonesData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_buildArmature);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_addTextureAtlasData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_getArmatureData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_replaceSlotDisplay);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_changeSkin);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_replaceDisplay);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_BaseFactory_getDragonBonesData);

extern se::Object* __jsb_dragonBones_CCTextureAtlasData_proto;
extern se::Class* __jsb_dragonBones_CCTextureAtlasData_class;

bool js_register_dragonBones_CCTextureAtlasData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCTextureAtlasData_setRenderTexture);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCTextureAtlasData_getRenderTexture);

extern se::Object* __jsb_dragonBones_CCTextureData_proto;
extern se::Class* __jsb_dragonBones_CCTextureData_class;

bool js_register_dragonBones_CCTextureData(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);

extern se::Object* __jsb_dragonBones_CCSlot_proto;
extern se::Class* __jsb_dragonBones_CCSlot_class;

bool js_register_dragonBones_CCSlot(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCSlot_getTexture);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCSlot_updateWorldMatrix);

extern se::Object* __jsb_dragonBones_CCArmatureDisplay_proto;
extern se::Class* __jsb_dragonBones_CCArmatureDisplay_class;

bool js_register_dragonBones_CCArmatureDisplay(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_dbInit);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_addDBEventListener);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_getRootDisplay);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_setAttachUtil);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_removeDBEventListener);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_setEffect);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_dispose);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_setOpacityModifyRGB);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_dbClear);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_dispatchDBEvent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_getDebugData);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_hasDBEventListener);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_dbUpdate);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_setDBEventCallback);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_setDebugBonesEnabled);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_getAnimation);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_setColor);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_bindNodeProxy);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_setBatchEnabled);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_dbRender);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_getArmature);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_convertToRootSpace);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_create);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureDisplay_CCArmatureDisplay);

extern se::Object* __jsb_dragonBones_CCFactory_proto;
extern se::Class* __jsb_dragonBones_CCFactory_class;

bool js_register_dragonBones_CCFactory(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_setTimeScale);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_getSoundEventManager);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_render);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_removeDragonBonesDataByUUID);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_update);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_remove);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_getTextureAtlasDataByIndex);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_getDragonBones);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_parseDragonBonesDataByPath);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_add);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_buildArmatureDisplay);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_stopSchedule);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_removeTextureAtlasDataByIndex);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_getTimeScale);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_isInit);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_destroyFactory);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_getClock);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_getFactory);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCFactory_CCFactory);

extern se::Object* __jsb_dragonBones_ArmatureCacheMgr_proto;
extern se::Class* __jsb_dragonBones_ArmatureCacheMgr_class;

bool js_register_dragonBones_ArmatureCacheMgr(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureCacheMgr_removeArmatureCache);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureCacheMgr_buildArmatureCache);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureCacheMgr_destroyInstance);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_ArmatureCacheMgr_getInstance);

extern se::Object* __jsb_dragonBones_CCArmatureCacheDisplay_proto;
extern se::Class* __jsb_dragonBones_CCArmatureCacheDisplay_class;

bool js_register_dragonBones_CCArmatureCacheDisplay(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_setTimeScale);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_render);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_addDBEventListener);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_setAttachUtil);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_removeDBEventListener);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_onEnable);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_setEffect);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_dispose);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_setOpacityModifyRGB);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_dispatchDBEvent);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_beginSchedule);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_updateAllAnimationCache);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_update);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_playAnimation);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_setDBEventCallback);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_updateAnimationCache);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_getTimeScale);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_getAnimation);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_onDisable);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_setColor);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_bindNodeProxy);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_setBatchEnabled);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_getArmature);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_stopSchedule);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CCArmatureCacheDisplay_CCArmatureCacheDisplay);

extern se::Object* __jsb_dragonBones_AttachUtilBase_proto;
extern se::Class* __jsb_dragonBones_AttachUtilBase_class;

bool js_register_dragonBones_AttachUtilBase(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_AttachUtilBase_associateAttachedNode);

extern se::Object* __jsb_dragonBones_RealTimeAttachUtil_proto;
extern se::Class* __jsb_dragonBones_RealTimeAttachUtil_class;

bool js_register_dragonBones_RealTimeAttachUtil(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_RealTimeAttachUtil_RealTimeAttachUtil);

extern se::Object* __jsb_dragonBones_CacheModeAttachUtil_proto;
extern se::Class* __jsb_dragonBones_CacheModeAttachUtil_class;

bool js_register_dragonBones_CacheModeAttachUtil(se::Object* obj);
bool register_all_cocos2dx_dragonbones(se::Object* obj);
SE_DECLARE_FUNC(js_cocos2dx_dragonbones_CacheModeAttachUtil_CacheModeAttachUtil);

#endif //#if USE_DRAGONBONES > 0
