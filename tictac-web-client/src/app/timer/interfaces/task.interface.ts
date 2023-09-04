import { Duration } from "moment"

export interface TaskTimer{
  id: string,
  intervalId: any,
  title: string,
  projectName?:string
  monetize?: boolean,
  duration?: Duration,
  momentStart: number
  momentEnd: number
}
