#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int n4octet(FILE *file)
{
    int n,i;

    i = fgetc(file);
    n = i << 24;

    i = fgetc(file);
    n += i << 16;

    i = fgetc(file);
    n += i << 8;

    i = fgetc(file);
    n += i;

    return n;
}

int n2octet(FILE *file)
{
    int n,i;

    i = fgetc(file);
    n = i << 8;

    i = fgetc(file);
    n += i;

    return n;
}

void o2octet(FILE *file,int n)
{
	fputc((0xFF00&n)>>8,file);
    fputc(0xFF&n,file);


}

void o4octet(FILE *file,int n)
{

	fputc((0xFF000000&n)>>25,file);
	fputc((0xFF0000&n)>>16,file);

	fputc((0xFF00&n)>>8,file);
	fputc(0xFF&n,file);

}

typedef struct
{
    int offset;
    int smf;
    int track;
    int div;
    int *ndata;
    unsigned char *data;
}Midi;

int MidiMeta(int *eoctet)
{

    if(eoctet[0] != 0xFF)
        return -1;




    return eoctet[2];
}

int MidiMetaType(int *eoctet)
{
	if((eoctet[0]&0XF0) == 0XB0) return -3;

    if(eoctet[0] != 0xFF)
        return -1;



	if(eoctet[1] == 0x51) return 2;
	if(eoctet[1] == 0x58) return 3;
	if(eoctet[1]< 7) return 0;
	if(eoctet[1] == 0x2F) return -2;

    return 1;
}

Midi* LoadMidi(char *path,int next)
{
    Midi *midi;
    FILE *file,*file2,*file3;
    int i;

    int extract = next;

    file = fopen(path,"rb");

    if(file == NULL) return NULL;

    int octet = 0;
    char toctet[5];
    int eoctet[3];
    int delta[4];
    char chaine[100];

    int l,mode = 0,delay = 0,j,dec = 0,di = 0,type,tempo = 0,k = 0,m,modeout = -1;
    int tdelay,exist=0,runningstat = -1;


    toctet[0] = fgetc(file);
    toctet[1] = fgetc(file);
    toctet[2] = fgetc(file);
    toctet[3] = fgetc(file);
    toctet[4] = 0;

    if(strcmp(toctet,"MThd") != 0)
        return NULL;

    midi = malloc(sizeof(Midi));

    printf("SNES MIDI\n");

    midi->offset = n4octet(file);

	//SMF 0,1,2
    midi->smf = n2octet(file);
    printf("SMF : %d\n",midi->smf);


    midi->track = n2octet(file);
    printf("track : %d\n",midi->track);

    midi->div = n2octet(file);
    printf("division :%d\n\n-------------------",midi->div);

    midi->ndata = malloc(sizeof(int) * midi->track);

    if(extract != -1)
    {
		sprintf(chaine,"track%d.mid",extract);
		file3 = fopen(chaine,"wb");


    	for(j = 0;j < 4;j++)
			fputc(toctet[j],file3);

		o4octet(file3,midi->offset);

		o2octet(file3,midi->smf);
		o2octet(file3,1);
		o2octet(file3,midi->div);
    }

	int n = midi->track;
	//n = 3;

	int modeold;
    for(i = 0;i < n;i++)
    {
        toctet[0] = fgetc(file);
        toctet[1] = fgetc(file);
        toctet[2] = fgetc(file);
        toctet[3] = fgetc(file);
        toctet[4] = 0;



        midi->ndata[i] = n4octet(file);
		midi->data = malloc(sizeof(char) * midi->ndata[i]*2);
		m = 0;

		printf("\ntrack %d\n",i);



		if(extract == i)
		{
			for(j = 0;j < 4;j++)
				fputc(toctet[j],file3);

			o4octet(file3,midi->ndata[i]);
		}
		tdelay = 0;

        for(l = 0;l < midi->ndata[i];l++)
        {
            octet = fgetc(file);

            if(extract == i)
				fputc(octet,file3);
			//printf("%x ",octet);

            if(mode == 0) //Mode delta time
            {
				delta[di] = octet&0x7F;


                if(octet<128)
                {
                	delay = 0;
                	for(j = 0;j < di+1;j++)
						delay +=  delta[j]<<(7*(di-j));
                    mode = 1;
                }
                k = 0;

                di++;
            }else //mode action
            {
            	di = 0;


                if(k < 3)
                {
                    eoctet[k] = octet;

                    if(k == 1)
                    {

                        if((eoctet[0]&0XF0) == 0XC0)
                        {
                        	k = 0;
                        	mode = 0;
                        	dec = 0;
                        }

                        if(eoctet[0] < 0X80)
                        {
                        	k = 3;
                        	dec = 0;
                        }

                    }

                    if(k == 2)
                    {
                    	type = MidiMeta(eoctet);
                        if(type >=  0) dec = eoctet[k];
                        else dec = 0;



                    }

                    k++;


                }
                if(k >= 3)
                {
					type = MidiMetaType(eoctet);

                    if(type == 2)
                    {
                        if(k > 3) tempo += octet<<((8*(6-k)));
                    }

					if(type == -1)
                    {
                        //printf(" (%d  :%x %x %x)\n",delay,eoctet[0],eoctet[1],eoctet[2]);




                        float tmp = ( (float)tempo/(float)midi->div)/1000.0;


                        int sdelay = (tmp*delay);
                        sdelay = sdelay/4;

						//if(tdelay != 0 && delay <= 1) sdelay = 1;
						if((tmp*delay) <= 4 && (tmp*delay) > 0) sdelay = 1;
                        tdelay = sdelay;
						//printf("%x %x %x/",sdelay,eoctet[0],eoctet[1]);




						/*
						fputc(sdelay&0x00FF,file2);
						fputc( (sdelay&0xFF00)>>8,file2);


						fputc(eoctet[1],file2);
						fputc(eoctet[2],file2);

						*/


						modeold = modeout;
						modeout = -1;
						if( (eoctet[0] & 0xF0) == 0x90) modeout = 0;
						if( (eoctet[0] & 0xF0) == 0x80) modeout = 1;

						//printf("  %d ",modeout);
						//printf("  %d ",modeout);



						if(modeout == 0 && modeold != 0)
						{

							j = (m*6);
							runningstat = 0;

							midi->data[j+0] = tdelay&0x00FF;
							midi->data[j+1] = (tdelay&0xFF00)>>8;
							midi->data[j+2] = eoctet[1];
							midi->data[j+3] = eoctet[2];
						}

						if(modeout == 1 && modeold != 1)
						{
							j = (m*6);
							midi->data[j+4] = tdelay&0x00FF;
							midi->data[j+5] = (tdelay&0xFF00)>>8;
							m++;
						}

						if(eoctet[0] < 0X80)
						{
							if(runningstat == 1)
							{
								j = (m*6);
								midi->data[j+0] = tdelay&0x00FF;
								midi->data[j+1] = (tdelay&0xFF00)>>8;
								midi->data[j+2] = eoctet[0];
								midi->data[j+3] = eoctet[1];
								runningstat = 0;

							}else
							{
								j = (m*6);
								midi->data[j+4] = tdelay&0x00FF;
								midi->data[j+5] = (tdelay&0xFF00)>>8;
								runningstat = 1;
								m++;
							}

						}




                    }

                    if(type == -3)
                    {
                        //printf("\n(%x %x %x)",eoctet[0],eoctet[1],eoctet[2]);
                        //fputc(eoctet[2],file2);
                    }



                    dec--;
                    k++;

                    if(dec == -1) mode = 0;
                }



            }

        }

        if(extract == i) fclose(file3);

		if(m > 0)
		{
			sprintf(chaine,"track%d.sns",exist);
			exist++;
			file2 = fopen(chaine,"wb");
			int t,del,note;

			printf("event %d \n",m);

			for(j = 0;j < m;j++)
			{
				t = (j*6);


				del = midi->data[t+0] + (midi->data[t+1]<<8);
				//printf("%d/",del);

				if(del >= 0x80)
				{
					del = (midi->data[t+1]&0x7F) + 0x80;
					fputc(del,file2);
					fputc(midi->data[t+0],file2);
				}else
				{
					if(midi->data[t+0] == 0 && j > 0) midi->data[t+0] = 1;
					fputc(midi->data[t+0],file2);
				}

				int pitch = midi->data[t+2];

				note = (pitch%12);
				pitch = (( (pitch/12) )<<4) + note;

				if(note >= 5) pitch += 1;
				if(note >= 7) pitch += 1;
				if(note >= 9) pitch += 1;
				if(note >= 10) pitch += 1;


				//rintf("%.2x %.2x\n",pitch,midi->data[t+2]);

				//printf("%.2x%.2x   %.2x %.2x %.2x%.2x\n",midi->data[t+0],midi->data[t+1],midi->data[t+2],midi->data[t+3],(int)midi->data[t+4],midi->data[t+5]);
				fputc(pitch,file2);
				fputc(midi->data[t+3],file2);

				del = midi->data[t+4] + (midi->data[t+5]<<8);
				//printf("%x,",midi->data[t+4]);
				if( del >= 0x80)
				{
					del = (midi->data[t+5]&0x7F) + 0x80;
					fputc(del,file2);
					fputc(midi->data[t+4],file2);
				}else
				{
					fputc(midi->data[t+4],file2);
				}


				//fputc(midi->data[t+5],file2);


			}

			fputc(0XFF,file2);
			fputc(0XFF,file2);

			//printf("\n");

			fclose(file2);
		}

    }


    fclose(file);

    printf("tempo : %d \n",tempo);

    return midi;
}

int main(int argc, char** argv)
{
	if(argc < 2) return 0;
	int extract = -1;
	
	if(argc == 3) extract = (argv[2][0]-'0')&0x0F;
    	LoadMidi(argv[1],extract);

    	return 0;
}
