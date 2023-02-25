import { defineEventHandler } from 'h3';

const test = () => {
  return { success: true };
};

export default defineEventHandler(test);
