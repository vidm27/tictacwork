export interface Task{
  id: string,
  intervalId: any,
  title: string,
  projectName?:string
  monetize?: boolean,
  duration: number,
  momentStart?: number
  momentEnd?: number
}
