export const marginToMarkup = (num1: number) => {
  const marginToPercent = num1 / 100;
  const minusOne = 1 - marginToPercent;
  const total = ((marginToPercent / minusOne) * 100).toFixed(1);
  return parseFloat(total);
}