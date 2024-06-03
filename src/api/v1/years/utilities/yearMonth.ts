
export const generateQuarters = (yearId: number) => {
  return [
   { name: 'Q1', yearId},
   { name: 'Q2', yearId},
   { name: 'Q3', yearId},
   { name: 'Q4', yearId}
  ]
}

export const generateMonthsForQuarter = (quarterId: number, quarterName: string) => {
  const months: { [key: string]: string[] } = {
    Q1: ['January', 'February', 'March'],
    Q2: ['April', 'May', 'June'],
    Q3: ['July', 'August', 'September'],
    Q4: ['October', 'November', 'December']
  };

  return months[quarterName].map(name => ({ name, quarterId}))
}