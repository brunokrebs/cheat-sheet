const { spawn } = require('child_process');

const child = spawn('npm', ['login']);

process.stdin.pipe(child.stdin)

child.stdout.on('data', (data) => {
  const textData = data.toString('utf8');
  if (textData.indexOf('Username:' > 0)) {
    console.log('username');
    child.stdin.write("digituz-corp\r");
  } else if (textData.indexOf('Password:' > 0)) {
    console.log('password');
    child.stdin.write("d1G1tuz#C0rp$\r");
  } else if (textData.indexOf('Email:' > 0)) {
    console.log('email');
    child.stdin.write("bruno.krebs@digituz.com.br\r");
  } else {
    console.log(textData);
  }
});
