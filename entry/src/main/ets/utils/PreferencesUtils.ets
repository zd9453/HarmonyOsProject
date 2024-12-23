import { preferences } from '@kit.ArkData';

const SP_NAME = 'PersonData'

export const AGREEMENT = 'agreementState'

/**
 * 存
 */
export let putPersonLocalValue = async (key: string, value: preferences.ValueType) => {
  try {
    let localData = await preferences.getPreferences(getContext(), SP_NAME)
    localData.putSync(key, value)
    await localData.flush()
  } catch (e) {
    console.log('>>>>', `存储${key}失败`, e.message)
  }
}

/**
 * 取
 */
export let getPersonLocalValue = async (key: string, defaultValue: preferences.ValueType) => {
  try {
    let localData = await preferences.getPreferences(getContext(), SP_NAME)
    let result = localData.getSync(key, defaultValue)
    return result
  } catch (e) {
    console.log('>>>>', `获取${key}失败`, e.message)
    return defaultValue
  }
}

/**
 * 删
 */
export let deletePersonLocalValue = async (key: string) => {
  try {
    let localData = await preferences.getPreferences(getContext(), SP_NAME)
    localData.deleteSync(key)
    await localData.flush()
  } catch (e) {
    console.log('>>>>', `删除${key}失败`, e.message)
  }
}