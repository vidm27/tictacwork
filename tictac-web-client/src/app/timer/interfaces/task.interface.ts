
export interface TaskTimer{
  id: string,
  intervalId: any,
  title: string,
  projectName?:string
  monetize?: boolean,
  duration?: any,
  momentStart: any
  momentEnd: any
}
